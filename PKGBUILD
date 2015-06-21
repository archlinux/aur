# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=timblserver
pkgver=1.9
pkgrel=1
pkgdesc="Tilburg Memory Based Learner Server."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('timbl')
makedepends=('libtool' 'autoconf')
options=(!libtool)
url="http://ilk.uvt.nl/timbl"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('ba5af5bdc1f638cd24edf68b6083854a')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
