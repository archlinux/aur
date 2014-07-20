# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

pkgname=debhelper
pkgver=9.20140613
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="http://kitenet.net/~joey/code/debhelper/"
license=('GPL2' 'GPL3')
depends=('binutils' 'dpkg>=1.16.2' 'file>=3.23' 'html2text' 'man-db>=2.5.1' 'perl>=5.6.0' 'po-debconf')
makedepends=('po4a>=0.24' 'man-db>=2.5.1' 'file>=3.23')
optdepends=('dh-make')
source=("http://launchpad.net/debhelper/main/$pkgver/+download/debhelper_$pkgver.tar.gz")
sha256sums=('11d02f7e45affeddf327efc923a582b3fa7ba7246a9858a2a15d5262078bcedd')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
