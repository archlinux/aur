# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Nassim Kacha <nassim.kacha@gmail.com>

pkgname=innotop
pkgver=1.13.0
pkgrel=1
pkgdesc='A powerful "top" clone for MySQL (MariaDB)'
arch=('any')
url="https://github.com/innotop/innotop"
license=('GPL2')
depends=('perl-dbd-mysql' 'perl-term-readkey')
options=('!emptydirs')
source=(https://github.com/innotop/innotop/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6ec91568e32bda3126661523d9917c7fbbd4b9f85db79224c01b2a740727a65c')

build() {
  cd $pkgname-$pkgver

  perl Makefile.PL
}

package() {
  cd $pkgname-$pkgver

  make INSTALLSITESCRIPT=/usr/bin DESTDIR="$pkgdir"/ install 
}
