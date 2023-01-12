# Maintainer: Cavernosa <cvrns at proton dot me>
pkgname=dumb_runtime_dir
pkgver=1.0.4
pkgrel=1
pkgdesc="Creates an XDG_RUNTIME_DIR on login and never removes it."
arch=('x86_64')
url="https://github.com/ifreund/dumb_runtime_dir"
license=('custom:0BSD')
depends=('pam')
makedepends=('git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make all
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
