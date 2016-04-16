# Maintainer: Your Name <youremail@domain.com>
pkgname=earlyoom
pkgver=0.9
pkgrel=2
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('59fe2bff6677686a76e6aaec5b4b2be8')

build() {
	cd "$pkgname-$pkgver"
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX=/usr install
}
