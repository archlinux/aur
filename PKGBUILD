# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=file2key
pkgver=2
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://github.com/maandree/file2key"
license=('GPL3')
depends=(glibc libpassphrase libkeccak)
makedepends=(make coreutils gcc glibc libpassphrase libkeccak)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(aa8d50ade18a77a5f721d2c843e089abf5a6ee9aa163821c564db19e0de75ac8)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

