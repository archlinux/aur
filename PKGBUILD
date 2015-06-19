# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=resample
pkgver=1.8.1
pkgrel=1
pkgdesc="Sampling-rate conversion and filter design utilities"
arch=('i686' 'x86_64')
url="http://ccrma.stanford.edu/~jos/resample/Free_Resampling_Software.html"
license=('LGPL2')
depends=('glibc')
source=("http://ccrma.stanford.edu/~jos/gz/$pkgname-$pkgver.tar.gz")
md5sums=('c3c1c64e4bb9b0bdc6062b8ad619aef1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
