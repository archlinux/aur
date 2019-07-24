# Maintainer: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>
pkgname=bklk-git
pkgver=latest
pkgrel=1
pkgdesc="Ncurses Binary Clock"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Ruunyox/bklk"
license=('MIT')
depends=('ncurses')
source=("git+https://github.com/Ruunyox/bklk.git")
md5sums=(SKIP)

_gitname="bklk"

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_gitname}"
}

build() {
	cd "$srcdir/$_gitname"
  	make
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 $_gitname "$pkgdir/usr/bin/$_gitname"
}
