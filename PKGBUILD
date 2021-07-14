# Maintainer: throwbly
pkgname='cft'
pkgver=0.3
pkgrel=1
pkgdesc="Quickly copy text from a file to the clipboard without opening unnecessary programs"
arch=("any")
url="https://github.com/throwbly/cft"
license=('MIT')
depends=('xclip')
makedepends=('git' 'python-pip')
source=('cft::git://github.com/throwbly/cft')
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ./cft "$pkgdir/usr/bin/cft"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
