# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=fte
pkgver=0.50.02
pkgrel=1
pkgdesc="A free text editor for developers"
arch=('i686' 'x86_64')
url="http://fte.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'gpm>=1.20.4' 'libxpm' 'slang')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-20110708-src.zip
        http://downloads.sourceforge.net/$pkgname/$pkgname-20110708-common.zip)
md5sums=('44353697551c409c5f3207b7a87bdc22'
         '0f0b6a511d5fb161235dee35df169e47')

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr clean all
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
}
