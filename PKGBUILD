# Contributor: drrossum <youremail@domain.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=jday
pkgver=2.4
pkgrel=1
pkgdesc="Julian Date calculator"
arch=(i686 x86_64)
url="http://jday.sourceforge.net/"
license=('BSD')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('817af56005d1346677271ed2fab63ef5')
sha1sums=('46b020ef315eb21b3b0e5192693687ef286cf2e1')
sha256sums=('3b15f3a1b552ffae7c343bd47bf89e8073da9ef8c2ec6d79b90d56f8c3a06fda')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

