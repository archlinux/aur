# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Sasasu <lizhaolong0123@gmail.com>

pkgname=hex2bin-git
pkgver=r45.141f873
pkgrel=1
pkgdesc="Hex to binary converter."
arch=('any')
url="https://github.com/Keidan/hex2bin"
license=('GPL3')
replaces=('hex2bin')
depends=()
makedepends=('git' 'make' 'cmake')
source=("$pkgname::git+https://github.com/Keidan/hex2bin")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DDISTRIBUTION=release .
	make
}
package() {
	install -Dm755 "$srcdir/$pkgname/bin/hex2bin" "$pkgdir/usr/bin/hex2bin"
}
