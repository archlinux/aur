# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=dcap
pkgver=2.47.9
pkgrel=1
pkgdesc="Client Tools for dCache"
arch=(i686 x86_64)
url="https://github.com/dCache/$pkgname"
license=('LGPL')
depends=('openssl' 'krb5')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dCache/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('2a36a497bdf798d58375f24c1633b6e6032b51243c19a6cda18533228d21c2c5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sh bootstrap.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
