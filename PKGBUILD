# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=psmoveapi
pkgver=3.0.0
pkgrel=1
pkgdesc="Playstation Move Motion Controller API"
arch=(i686 x86_64)
url="http://thp.io/2010/psmove/"
license=('GPL2')
depends=('bluez-libs' 'libsystemd')
makedepends=('cmake')
source=("https://moveonpc.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha1sums=('37a60e8fa98cf30358899fbbff37c4a9636b813f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
