# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>
pkgname=devc
pkgver=0.4.1
pkgrel=3
pkgdesc="A CLI tool to manage your devcontainers using docker-compose"
arch=('x86_64')
url="https://git.sr.ht/~nka/devc"
license=('GPL3')
depends=('docker-compose')
makedepends=(
	'make'
	'go'
)
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~nka/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1879b64d5bbb04549d96d5ea66377c58')
sha256sums=('1874012cc1baea51ec15ab55cf36477f766b0fab991beba57cf522fc7b80122f')
sha512sums=('a36b6d52456f5139be04237602fd65e57f07a77962d8d705d579f1052c205c7fdcb8400e506ff88a0dd8bdc3d6a4542e89cc3363ec5c5155a43bd5e0ca226e4c')

build() {
	cd "$pkgname-v$pkgver"
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
