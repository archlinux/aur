# Maintainer: Volodymyr Vriukalo <vriukalovolodymyr æt protonmail-dot-com>
pkgname=cdecl-pjl
pkgver=18.4.1
pkgrel=1
pkgdesc="C declaration converter with improvements by Paul J. Lucas"
arch=('ppc' 'ppc64' 'i386' 'x86_64')
url="https://github.com/paul-j-lucas/cdecl"
license=('GPL3')
conflicts=("cdecl" "cdecl-pjl-git")
provides=("cdecl")
depends=()
makedepends=('autoconf' 'automake' 'm4' 'libtool' 'flex' 'bison' 'git')

_source_tag="cdecl-${pkgver}"
source=("git+https://github.com/paul-j-lucas/cdecl.git#tag=${_source_tag}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/cdecl"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cdecl"
  make DESTDIR="$pkgdir" install
}
