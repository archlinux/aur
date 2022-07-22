# Maintainer: Nimai Patel <nimai.m.patel@gmail.com>
pkgname=brn-git
pkgver=r31.454e213
pkgrel=1
epoch=
pkgdesc="Text editor based bulk rename utility."
arch=('any')
url="https://github.com/nimaipatel/brn/"
license=('AGPL')
groups=()
depends=()
makedepends=("git" "gcc" "make")
optdepends=()
provides=('brn')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/nimaipatel/brn.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/$pkgname/brn" "$pkgdir/usr/bin/brn"
	cp "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
