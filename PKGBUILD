# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-separable-svn
pkgver=0.1.1.r83053
pkgrel=1
pkgdesc="Language-independent machine translation engine and tools to manage language data."
url="http://apertium.org"
license=('GPL2')
makedepends=('svn')
depends=('apertium>=3.4.2')
options=('!libtool')
arch=('i686' 'x86_64')
source=("svn://svn.code.sf.net/p/apertium/svn/branches/apertium-separable")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/apertium-separable"
  local ver="$(svnversion)"
  printf "%s" "0.1.1.r${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/apertium-separable"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/apertium-separable"
  make DESTDIR="$pkgdir/" install
}
