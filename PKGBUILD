# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=solar-python
pkgver=2.1
pkgrel=1
pkgdesc="Solar data calculation and prediction library for Python"
arch=(any)
url="https://github.com/maandree/solar-python"
license=('AGPL3')
depends=(python3)
makedepends=(make coreutils python3)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(eb2e1c23e9e223012d06ed913cefa1d04646c678f939b03b13ce625be437498f)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4 install DESTDIR="$pkgdir"
}

