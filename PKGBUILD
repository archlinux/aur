# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=openelearning-bin
pkgver=1.4.7
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
sha256sums=('aa761bd2b6b3ff07d70e5912e8516c7d11538e54189c16e508c1f43eeb72ee37')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/openelearning/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}
