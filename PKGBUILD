#Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii-current
pkgver=`date +%Y%m%d` 
pkgrel=1
pkgdesc="IRC and ICB client that runs under most UNIX platforms."
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/ircii/"
license=('BSD')
depends=('lftp' 'ncurses')
conflicts=('ircii')
source=("http://ircii.warped.com/$pkgname.tar.bz2")
md5sums=('SKIP')

build() {
  cd $srcdir/ircii
  unset CFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man --libexecdir=/usr/share/$pkgname
  make
}

package() {
  cd "$srcdir/ircii"
  make DESTDIR="$pkgdir" mandir="$pkgdir/usr/share/man/man1" install
  install -Dm644 doc/Copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

