# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=evi
pkgver=1.1.0
pkgrel=1
pkgdesc="Editing layer for secure, encrypted documents"
arch=('x86_64')
url="https://github.com/notwithering/evi"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fb1052c349858362beb333bb97c6798d9983d6c9852ad124b41049f4391b30f6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -o "$pkgname"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}