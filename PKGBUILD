# Maintainer: Kristóf Jakab <jaksi@jaksi.io>
pkgname=libzorpll-git
pkgver=6.0.6.0
pkgrel=1
pkgdesc="Low level library functions for Zorp"
arch=('x86_64')
url="https://github.com/balabit/libzorpll"
license=('LGPL-2.0')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libzorpll::git+https://github.com/balabit/libzorpll.git#branch=6.0.6.0')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libzorpll"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/libzorpll"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/libzorpll"
	make DESTDIR="$pkgdir/" install
}
