# Maintainer: Trevor Tilby <trevor dot tilby at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=epix
pkgver=1.2.22
pkgrel=1
pkgdesc="ePiX - Utilities for creating mathematically accurate figures"
arch=('i686' 'x86_64')
url="http://mathcs.holycross.edu/~ahwang/epix/ePiX.html"
license=('GPL')
depends=('ghostscript' 'texlive-latexextra' 'texlive-pictures' 'texlive-pstricks')
source=("http://mathcs.holycross.edu/~ahwang/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a002184deb45b5f8bb212db9ee2d712a')
sha1sums=('32920cb9a612c668b0c8b2e6e1b93ad7f3475de9')
sha256sums=('c314b47110cd3ff081e80f60ac4834c0291da94ddfac805ea20036871f4d488f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

