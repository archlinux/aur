# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sat
pkgver=1.0
pkgrel=1
pkgdesc="A simple alternative to at"
arch=(i686 x86_64)
url="https://github.com/maandree/sat"
license=('MIT' 'custom:GFDL1.3')
depends=('linux>=2.6.39' glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(9efef3a182a1649665641473cd219c9968bec07d19693082d05342a3a52c1669)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

