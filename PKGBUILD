pkgname=rubycreator
pkgver=4.1.0
pkgrel=1
pkgdesc="Plugin to add Ruby language support to QtCreator IDE."
arch=("x86_32" "x86_64")
url="http://hugopl.github.io/RubyCreator/"
license=('LGPL3')
groups=()
depends=('qtcreator')
makedepends=('ruby')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('https://github.com/hugopl/RubyCreator/archive/v4.1.0.tar.gz')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/RubyCreator-$pkgver"
  ./configure.rb
  cd build
  make -j9
}

check() {
  test -f "$srcdir/RubyCreator/build/libRuby.so"
}

package() {
  mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
  mv "$srcdir/RubyCreator/build/libRuby.so" "$pkgdir/usr/lib/qtcreator/plugins"
}
