# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=seahaven
pkgver=1.60
pkgrel=3
pkgdesc="Seahaven Towers is a classic Unix solitaire game updated with new card images."
arch=('i686' 'x86_64')
url="http://seahaven.sourceforge.net/"
license=('ISC')
depends=('libxext' 'libxft')
source=(http://seahaven.sourceforge.net/$pkgname-$pkgver.tgz)
md5sums=('4f324236a05913375fb190b57de3447a')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 seahaven $pkgdir/usr/bin/seahaven

  # License
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Man page
  install -Dm644 seahaven.6 $pkgdir/usr/share/man/man6/seahaven.6  
}