# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=orphan-reaper
pkgver=2.1
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64)
url="https://github.com/maandree/orphan-reaper"
license=('GPL3')
depends=(glibc 'linux>=3.4')
makedepends=(glibc gcc make coreutils texinfo auto-auto-complete)
install=orphan-reaper.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(916748575fa6d675cd6631d35afc1407a17fd4635de7a8f2e1f4109b78045409)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper install DESTDIR="$pkgdir"
}

