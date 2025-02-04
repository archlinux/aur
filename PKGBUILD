# Maintainer: robertfoster

pkgname=openca-tools
pkgver=1.3.1
pkgrel=1
pkgdesc="A robust, full-featured and Open Source out-of-the-box Certification Authority"
arch=('i686' 'x86_64')
url="http://www.openca.org/projects/openca/"
license=('GPL2')
depends=('openssl')
options=('!libtool')
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static --sbindir=/usr/bin
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  rm $pkgdir/usr/share/man/man1/verify.1
}

sha256sums=('4890fb5db61478e189707ec72a78ded71c11dfe5251aa3cf578dbc78737724aa')
