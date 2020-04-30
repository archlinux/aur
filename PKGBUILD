# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=swayshot
pkgver=0.1.1
pkgrel=1
pkgdesc="An easy to use screenshot tool for sway."
arch=("x86_64")
url="https://gitlab.com/WhyNotHugo/swayshot"
license=('MIT')
depends=("sway" "grim" "slurp" "jq")
makedepends=("scdoc")
source=("https://gitlab.com/WhyNotHugo/swayshot/-/archive/v${pkgver}/swayshot-v${pkgver}.tar.gz")
md5sums=('9ef9fe8b98e35c7d5c81cae0624a16e0')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
