pkgname=sgrep
pkgver=1.94a
pkgrel=1
pkgdesc=""
url=""
arch=('i686' 'x86_64')
license=('')
depends=('glibc')
source=("https://fossies.org/linux/misc/old/$pkgname-$pkgver.tar.gz")
md5sums=('8cdd044602061b0ecd3e610fde655a3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --datadir=/usr/share/$pkgname \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
