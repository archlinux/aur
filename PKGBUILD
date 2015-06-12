# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=krandom
pkgver=1.2
pkgrel=1
pkgdesc="Keccak-based userspace pseudorandom number generator"
arch=(i686 x86_64)
url="https://github.com/maandree/krandom"
license=('AGPL3')
depends=(libkeccak argparser glibc)
makedepends=(libkeccak argparser glibc auto-auto-complete texinfo gcc make coreutils)
install=krandom.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(7aa622a9d456b846f589fd4e47c926559294248db19b30538e5fc550e842bac5)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

