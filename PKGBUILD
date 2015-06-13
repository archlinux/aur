# Maintainer: Alastair Pharo <asppsa at gmail dot com>
# Contributor: Alain Kalker <a.c.kalker at gmail dot com>

pkgname=texmacs-pure
pkgver=0.64
pkgrel=1
pkgdesc="Pure plugin for GNU TeXmacs"
arch=("i686" "x86_64")
license=('LGPL3')
url="https://bitbucket.org/purelang/pure-lang/wiki/TeXmacs"
depends=('texmacs' "pure")
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/pure-$pkgver.tar.gz")
md5sums=('399b0a5cb6bbf0042ce42f9a857e332e')

build() {
  cd $srcdir/pure-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/pure-$pkgver
  make DESTDIR=$pkgdir tmdir=/usr/share/TeXmacs install-tm
}
