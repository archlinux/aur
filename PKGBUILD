# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pylibcoopgamma
pkgver=1.1
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibcoopgamma"
license=('GPL3')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython general-preprocessor)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1952a23678508b8c5e97742cb8a048cfeadd5e193bbd74b2f74fcc6b086f227f)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

