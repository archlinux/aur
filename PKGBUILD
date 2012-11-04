# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

pkgname=debhelper
pkgver=9.20120909
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="http://kitenet.net/~joey/code/debhelper/"
license=('GPL2' 'GPL3')
depends=('binutils' 'dpkg>=1.14.15' 'file>=3.23' 'html2text' 'man-db>=2.5.1' 'perl>=5.6.0' 'po-debconf')
makedepends=('po4a>=0.24' 'man-db>=2.5.1' 'file>=3.23')
optdepends=('dh-make')
source=("http://launchpad.net/debhelper/main/$pkgver/+download/debhelper_$pkgver.tar.gz")
sha256sums=('fabcdb9c41975ea0a1ccc66d6e065e424ed7a2119f6f1a6f7bfb7d06701370af')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
