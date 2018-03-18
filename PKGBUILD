# Maintainer: Alastair Pharo <asppsa at gmail dot com>
# Contributor: Alain Kalker <a.c.kalker at gmail dot com>

pkgname=texmacs-pure
pkgver=0.67
pkgrel=1
pkgdesc="Pure plugin for GNU TeXmacs"
arch=("i686" "x86_64")
license=('LGPL3')
url="https://bitbucket.org/purelang/pure-lang/wiki/TeXmacs"
depends=('texmacs' "pure")
groups=(pure-complete pure-math)
source=("https://github.com/agraef/pure-lang/releases/download/pure-$pkgver/pure-$pkgver.tar.gz")
md5sums=('2d8c705f1016b4860ba743e9bbf8b5e5')

build() {
  cd $srcdir/pure-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/pure-$pkgver
  make DESTDIR=$pkgdir tmdir=/usr/share/TeXmacs install-tm
}
