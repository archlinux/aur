# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=libgt
pkgver=0.3.11
pkgrel=1
pkgdesc="C library for Guardtime Keyless Signature Service"
arch=(i686 x86_64)
license=(Apache)
url="http://www.guardtime.com/resources/developer-tools/"
depends=('openssl' 'curl')
#makedepends=('doxygen')
source=(http://download.guardtime.com/$pkgname-$pkgver-src.tgz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 src/license.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  make DESTDIR="$pkgdir" install
}
md5sums=('60b8469e77ef056127ad61ae10b8ad63')
