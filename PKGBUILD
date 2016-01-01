# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sat
pkgver=1.1
pkgrel=1
pkgdesc="A simple alternative to at"
arch=(i686 x86_64)
url="https://github.com/maandree/sat"
license=('MIT' 'custom:GFDL1.3')
depends=('linux>=2.6.39' glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a0453ffcc376a5a13bc4687927e0c2c972a6f776783687e946435b76b417b07b)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

