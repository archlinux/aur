# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
# Contributor: aksr <aksr at t-com dot me>
pkgname=libmawk
pkgver=1.0.3
pkgrel=1
pkgdesc="a fork of mawk 1.3.3, restructured for embedding"
url="http://www.repo.hu/projects/libmawk/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('50ac3e34320d88eb42fb78f422dc77b20c147fa827f608e8430c88052c8a3ffa')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
