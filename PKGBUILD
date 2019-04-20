# Contributor: Jaryl Chng <mrciku@gmail.com>
pkgname=libbfio
pkgver=20190112
pkgrel=1
pkgdesc='Library for providing a basic file input/output abstraction layer'
arch=('x86_64' 'i686')
url='https://github.com/libyal/libbfio'
license=('LGPL')
provides=('libbfio')
conflicts=('libbfio-git')
depends=('glibc')
source=('https://github.com/libyal/libbfio/releases/download/'$pkgver'/libbfio-alpha-'$pkgver'.tar.gz')
sha512sums=('3bf8c4fec6a283c6e03cc25e33737b28fc747655b720b44e621b402f6f3181e9b1778555db45ca4d7d10f36996cb7f2e5d379d0cf958c5aae5579cbc0705e310')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-wide-character-type=yes
}

build() {
  make -C "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
