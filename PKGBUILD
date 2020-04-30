# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=swaygrab
pkgver=0.2.1
pkgrel=1
pkgdesc="An easy to use screenshot tool for sway."
arch=("x86_64")
url="https://gitlab.com/WhyNotHugo/swaygrab"
license=('MIT')
depends=("sway" "grim" "slurp" "jq")
makedepends=("scdoc")
source=("https://gitlab.com/WhyNotHugo/swaygrab/-/archive/v${pkgver}/swaygrab-v${pkgver}.tar.gz")
md5sums=('cae7608bdbff0890a49b96d80a685b49')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
