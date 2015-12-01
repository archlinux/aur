# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=slack
pkgver=2.2
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://github.com/maandree/slack"
license=('GPL3')
depends=(glibc 'linux>=2.6.28')
makedepends=(glibc gcc make coreutils texinfo auto-auto-complete)
install=slack.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(7459a54d2a360b25da60d99fb025cf6e04e5148d937ce8e6c2b7bd69eaf5931d)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

