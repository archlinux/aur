# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=svgcleaner-git
pkgver=v0.6.2.31.gad28f8d
pkgrel=1
pkgdesc="Program for reducing size of svg images without loss"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/svgcleaner/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
source=('git+https://github.com/RazrFalcon/SVGCleaner.git')
md5sums=('SKIP')
_gitname="SVGCleaner"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s" "$(git describe --tags|tr - .)"
}

build() {
  cd "$srcdir"/"$_gitname"
  cargo build --release
}

package() {
  cd "$srcdir"/"${_gitname}"/target/release
  install -Dm755 svgcleaner "$pkgdir"/usr/bin/svgcleaner
}
