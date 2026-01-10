# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=libmatchbox
pkgver=1.14
pkgrel=1
pkgdesc="Base library for Matchbox WM"
arch=('x86_64')
license=('LGPL')
depends=('pango' 'libpng' 'libjpeg-turbo' 'libxext')
url="https://www.yoctoproject.org/software-item/matchbox/"
source=("https://git.yoctoproject.org/libmatchbox/snapshot/libmatchbox-${pkgver}.tar.gz")
sha256sums=('2d0c3e827acb8f95e801168d6f7fa03497e06ff60cbfe0b8ae7c5e740295c6ac')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-pango --enable-jpeg
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
