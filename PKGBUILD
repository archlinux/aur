# Current Contributor: Doug Penner <darwinsurvivor@gmail.com>
# Past Contributor: Marco Praher <marco.praher@gmx.at>
pkgname=gnocky
pkgver=0.0.7
pkgrel=2
pkgdesc='GTK written GUI frontend for gnokii'
arch=('i686' 'x86_64')
url='http://www.gnokii.org/'
license=('GPL')
depends=('libglade' 'gnokii>=0.6.26' 'libical')
makedepends=('make' 'gcc')
install='gnocky.install'
source=("http://www.gnokii.org/download/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('607b25ee3bbfc0cee5664018c302d8e0')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure LIBS=-lgthread-2.0
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr/share/gnocky install
}

