# Maintainer: willemw <willemw12@gmail.com>
# Contributor: boenki <boenki at gmx dot de>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=jeex
pkgver=12.6.1
pkgrel=4
pkgdesc="Simple GTK+ hex editor"
arch=('i686' 'x86_64')
#url="http://www.hds619.net/jeex.php"
url="http://sourceforge.net/projects/slackbuildsdirectlinks/files/jeex/"
license=('GPL3')
depends=('gtk2')
#backup=(etc/jeex.rc)
source=(http://sourceforge.net/projects/slackbuildsdirectlinks/files/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('7a6035de61d04b0dabb4b31fc356ac52')

_srcdir=$pkgname-${pkgver:0:4}

build() {
  cd $_srcdir
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd $_srcdir
  make check
}

package() {
  cd $_srcdir
  make DESTDIR="$pkgdir/" install
}

