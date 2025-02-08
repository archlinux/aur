# Maintainer: Jacob Aulin <jacob.aulin@proton.me>
pkgname='quickbuild-git'
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
  cd "$srcdir/quickbuild"
  git describe --tags
}

build() {
	cd "$srcdir/quickbuild"
	make
}

package() {
	cd "$srcdir/quickbuild"
  install -Dm 755 "./bin/quickbuild" "$pkgdir/usr/bin/quickbuild"
}
