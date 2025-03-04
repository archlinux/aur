# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=openelearning-bin
pkgver=1.7.0
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
sha512sums=('e1b908cecabf24638560d3ad3b5ae24a7b26eb5f64e75b8696f7b7ea7ec5066dea4a9e8a78f9c6e74172722b63b9a930ec11213f8ee63449f4bd7d1c8aabadc5')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/openelearning/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}
