# Maintainer: Christoph W <c w e g e n e r at gmail dot com>

pkgname=coinget
pkgver=2.0.0
pkgrel=1
pkgdesc="the fastest cli price checker for cryptocurrencies"
arch=('x86_64')
url="https://github.com/Olavhaasie/coinget"
license=('MIT')
depends=('curl')
makedepends=()
provides=('coinget')
source=("https://github.com/Olavhaasie/coinget/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('faf7998d1355331e82973564befefa23')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make INSTDIR="$pkgdir/usr/" INSTMAN="$pkgdir/usr/share/man/man1/" install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/coinget/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/coinget/LICENSE"
}
