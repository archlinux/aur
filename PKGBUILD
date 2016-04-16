# Maintainer: Your Name <youremail@domain.com>
pkgname=earlyoom
pkgver=0.10
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/florianjacob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('5e3de7040c8a703cacabc6c582c44b5f')

build() {
	cd "$pkgname-$pkgver"
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
