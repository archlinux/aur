# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=orphan-reaper
pkgver=2.2
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64)
url="https://github.com/maandree/orphan-reaper"
license=('GPL3')
depends=(glibc 'linux>=3.4')
makedepends=(glibc gcc make coreutils texinfo auto-auto-complete)
install=orphan-reaper.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(637e161f9994003e5fc355fcd179a976b18c113bcfa76d34751585930c1a6bf6)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper install DESTDIR="$pkgdir"
}

