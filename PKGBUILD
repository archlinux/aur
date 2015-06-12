# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=setpgrp
pkgver=1
pkgrel=2
pkgdesc="Commands providing access to the setpgrp and getpgrp system calls"
arch=(i686 x86_64)
url="https://github.com/maandree/setpgrp"
license=('GPL3')
depends=(glibc)
makedepends=(make coreutils gcc glibc)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(d058c523e26390851afb309cfa5293ed83df04440506275981615b23cb7ef886)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

