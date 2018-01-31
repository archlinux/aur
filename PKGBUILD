# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=bashdb
pkgver=4.4_0.94
pkgrel=1
pkgdesc="A debugger for Bash scripts loosely modeled on the gdb command syntax"
arch=('any')
url="http://bashdb.sourceforge.net/"
license=('GPL')
depends=('bash' 'python-pygments' 'pygmentize')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver/_/-}.tar.bz2)
sha512sums=('97e7d057f16d90d7f1677e1b29d2467d5ee263e9aaad64e2d7a8b8a19b3f3ca68023f23a45faea235fdba57e803fae762a19aab67f650b81e868a8a01c5b1fb7')

build() {
  cd $pkgname-${pkgver//_/-}
  ./configure --prefix=/usr --disable-static -C
  make
}
package() {
  cd $pkgname-${pkgver//_/-}
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/info/dir
}
