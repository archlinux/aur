# Maintainer: Alastair Pharo <asppsa at gmail dot com>
# Contributor: Alain Kalker <a.c.kalker at gmail dot com>

pkgname=texmacs-pure
pkgver=0.68
pkgrel=1
pkgdesc="Pure plugin for GNU TeXmacs"
arch=("i686" "x86_64")
license=('LGPL3')
url="https://bitbucket.org/purelang/pure-lang/wiki/TeXmacs"
depends=('texmacs' "pure")
makedepends=('llvm35')
groups=(pure-complete pure-math)
source=("https://github.com/agraef/pure-lang/releases/download/pure-$pkgver/pure-$pkgver.tar.gz")
md5sums=('082d522d05e58e55dc8094ba4c3d3eda')

build() {
  cd $srcdir/pure-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/pure-$pkgver
  make DESTDIR=$pkgdir tmdir=/usr/share/TeXmacs install-tm
}
