# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=exec-as
pkgver=1.1
pkgrel=1
pkgdesc="A command that lets you start another command with any argv[0]"
arch=(i686 x86_64)
url="https://github.com/maandree/exec-as"
license=('GPL3')
depends=(glibc)
makedepends=(make coreutils gcc glibc texinfo)
install=exec-as.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(7dd73559c42cdb047dd74d735642f0a4f39790b16d44f23841935e69da926f4d)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

