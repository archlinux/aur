# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=evi
pkgver=1.0.0
pkgrel=1
pkgdesc="Editing layer for secure, encrypted documents"
arch=('x86_64')
url="https://github.com/notwithering/evi"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9441d08037b7f97ddc232a540df949c40fd349cf31e1055c0dc91faa4eb6e8e0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -o "$pkgname"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}