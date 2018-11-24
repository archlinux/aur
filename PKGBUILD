# Maintainer: Sauyon Lee <sauyon@satori>
pkgname=gosh
pkgver=0.2.3
pkgrel=2
pkgdesc="interactive shell for Golang"
arch=('i686' 'x86_64')
url="https://github.com/mkouhei/gosh"
license=('GPL')
depends=('go' 'go-tools')
makedepends=()
source=("$pkgname-$pkgver::https://github.com/mkouhei/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('fff34e4fcd165f937df61233fbc169f6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

	go build
}

# this is broken for some reason
#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  go test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
