# Maintainer: Amber <amber@mail.cyborgtrees.com>
# Contributor: yannicklm <yannicklm1337@gmail.com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xpenguins
pkgver=3.2.1
pkgrel=3
pkgdesc="Ever wanted cute little penguins walking along the tops of your windows?"
depends=('libxpm' 'gtk3')
source=(http://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
license=('GPL2')
arch=('i686' 'x86_64' 'aarch64')
url="https://www.ratrabbit.nl/ratrabbit/software/xpenguins/index.html"
sha256sums=('b5a961684c461409527fef2cf266d8ae3823bd7a9cf79e678fa205e1de611c0f')

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
