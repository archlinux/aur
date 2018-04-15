# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=rw
pkgver=1.0
pkgrel=1
pkgdesc="Blockwise input/output"
arch=('x86_64')
url="https://sortix.org/rw"
license=('custom:ISC')
depends=('glibc')
makedepends=('git')
_commit=755e3df0fab3c19d9c69c52dcb04687df8f587e2
source=(git+https://gitlab.com/sortix/rw-portable.git#commit=$_commit)
md5sums=('SKIP')

build() {
	cd rw-portable
	make
}

package() {
	cd rw-portable
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
