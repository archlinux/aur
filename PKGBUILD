# Maintainer:  <actionless DOT loveless PLUS aur AT gmail MF com>
# Contributor: <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Tuure Piitulainen <tuure.piitulainen@gmail.com>
# Contributor: dpayne <darby.payne@gmail.com>

pkgname=cli-visualizer
pkgver=1.8
pkgrel=12
pkgdesc="A cli visualizer for audio (archived version)"
arch=('i686' 'x86_64')
#url="https://github.com/dpayne/cli-visualizer/"
url="http://web.archive.org/web/20241004213645/https://github.com/dpayne/cli-visualizer"
license=('MIT')
options=(!buildflags)
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'cmake')
conflicts=('vis')
install=${pkgname}.install
#source=("https://github.com/dpayne/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://web.archive.org/web/20200929213701/https://github.com/dpayne/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('927e4c18403c7a40397e8698ffefd1b37250be20fa0ec55fda9a82cf9cc8ba51')

build() {
    cd ${pkgname}-${pkgver}
    cmake ./
    make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 vis "${pkgdir}/usr/bin/vis"
  install -Dm644 examples/blue "${pkgdir}"/usr/share/doc/"${pkgname}"/blue
  install -Dm644 examples/config "${pkgdir}"/usr/share/doc/"${pkgname}"/config
  install -Dm644 examples/rainbow "${pkgdir}"/usr/share/doc/"${pkgname}"/rainbow
  install -Dm644 examples/basic_colors "${pkgdir}"/usr/share/doc/"${pkgname}"/basic_colors
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
