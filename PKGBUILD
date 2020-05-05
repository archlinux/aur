# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=swaygrab
pkgver=0.2.2
pkgrel=1
pkgdesc="An easy to use screenshot tool for sway."
arch=("x86_64")
url="https://gitlab.com/WhyNotHugo/swaygrab"
license=('MIT')
depends=("sway" "grim" "slurp" "jq")
makedepends=("scdoc")
source=("https://gitlab.com/WhyNotHugo/swaygrab/-/archive/v${pkgver}/swaygrab-v${pkgver}.tar.gz")
md5sums=('eea8246bf70c3e2b6ffff035ed05ef2b')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
