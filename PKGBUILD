# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

pkgname=debhelper
pkgver=9.20130720
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="http://kitenet.net/~joey/code/debhelper/"
license=('GPL2' 'GPL3')
depends=('binutils' 'dpkg>=1.16.2' 'file>=3.23' 'html2text' 'man-db>=2.5.1' 'perl>=5.6.0' 'po-debconf')
makedepends=('po4a>=0.24' 'man-db>=2.5.1' 'file>=3.23')
optdepends=('dh-make')
source=("http://launchpad.net/debhelper/main/$pkgver/+download/debhelper_$pkgver.tar.gz"
        'fr.po.patch')
sha256sums=('4128575e19c2a6dbe8bfe2af591976b6bc737bb9b5d89e91492c6d72c487b01f'
            '66f5c36f2652876d5b0a11246ad5c0ca6bfb85fc9ca868068e1080837a45e8ad')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/fr.po.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
