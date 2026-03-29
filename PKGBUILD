# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=openelearning-bin
pkgver=1.8.5
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
sha512sums=('9eef8fd00f194097e409ad61f0df6abd997dc74ac7c74c1b4cb3d9c8f3b4e3a305d01df260b16af3c48ae7f3fc662b61d25d2d6dd54d45349f5e364c40110cf8')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/openelearning/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}
