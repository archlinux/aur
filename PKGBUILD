# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pylibcoopgamma
pkgver=1.0
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibcoopgamma"
license=('GPL3')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython general-preprocessor)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1346ea34798942e874b09b1fb8633d2304296f3698b42e003ce2bd24e600d02a)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

