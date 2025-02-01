# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
# Contributor: aksr <aksr at t-com dot me>
pkgname=libmawk
pkgver=1.0.4
pkgrel=1
pkgdesc="a fork of mawk 1.3.3, restructured for embedding"
url="http://www.repo.hu/projects/libmawk/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('1f8bad481034d2bd583d621f73a2184540c3bbc3b610be04453576c6dbc6352e')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
