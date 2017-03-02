# Maintainer: Alberto Sánchez Molero <alsamolero at gmail.com>

pkgname=nodejs-base16-builder-git
_gitname=base16-builder
pkgver=1.3.0.r6.71a146c
pkgrel=1
pkgdesc="A nimble command-line tool that generates themes for your favourite programs."
arch=('i686' 'x86_64')
url="https://github.com/base16-builder/base16-builder"
license=('MIT')
makedepends=('npm' 'git')
source=(git+https://github.com/base16-builder/base16-builder.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long --tag | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$_gitname"
  npm install
}

package() {
  cd "$srcdir/$_gitname"
  npm install -g --prefix "$pkgdir/usr"
}
