# Maintainer: yannicklm <yannicklm1337@gmail.com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xpenguins
pkgver=2.2
pkgrel=2
pkgdesc="Ever wanted cute little penguins walking along the tops of your windows?"
depends=('libxpm')
source=(http://xpenguins.seul.org/$pkgname-$pkgver.tar.gz)
license=('GPL2')
arch=('i686' 'x86_64')
url="http://xpenguins.seul.org"
md5sums=('2ccf555d55f9b0377017322b3b3d27a4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package()
{
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
