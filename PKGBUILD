# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=openelearning-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A free, open-source Elearning editor for Linux"
arch=('x86_64')
url='https://www.openelearning.org'
license=('MIT')
provides=('openelearning')
options=('emptydirs')
depends=('libxss'
         'gtk3'
         'nss'
         'nodejs'
         'java-runtime')
source=("${pkgname%-bin}-${pkgver}.deb::https://www.openelearning.org/addScript/download/openelearning_${pkgver}_amd64.deb")
sha256sums=('c171f1d58b94c560da08abe4e204c8711b03c473b745bafd497338ff39ab233c')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/openelearning/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}
