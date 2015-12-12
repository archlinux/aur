# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=scrotty
pkgver=2.0
pkgrel=1
pkgdesc="Screenshot program for the framebuffer"
arch=(i686 x86_64)
url="https://github.com/maandree/scrotty"
license=('GPL3' 'custom:GFDL1.3')
depends=(linux glibc libpng)
makedepends=(glibc libpng make coreutils pkg-config gcc gettext 'texinfo>=4.11' auto-auto-complete)
install=scrotty.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(466528d6ecf0138f57c40541258389686e22771c28d40f28c00825faaeaab1a3)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-bash --with-fish --with-zsh
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

