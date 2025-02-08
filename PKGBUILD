# Maintainer: Jacob Aulin <jacob.aulin@proton.me>
pkgname='quickbuild'
pkgver=0
pkgrel=1
pkgdesc="A simple, lightweight, and fast build system for C, C++, and more"
arch=('x86_64')
url="https://github.com/nordtechtiger/quickbuild"
license=('MIT')
depends=()
makedepends=('make' 'clang' 'git')
source=("git+https://github.com/nordtechtiger/quickbuild.git")
sha256sums=('SKIP')
# validpgpkeys=()

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
  install -Dm 755 "./bin/quickbuild" "$pkgdir/usr/bin/quickbuild"
}
