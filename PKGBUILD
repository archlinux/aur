# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=evi
pkgver=1.1.1
pkgrel=1
pkgdesc="Editing layer for secure, encrypted documents"
arch=('x86_64')
url="https://github.com/notwithering/evi"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('38fa5dff962d6ee079a8f35677f607a78f39947747cd468192c01078be180af4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -o "$pkgname"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}