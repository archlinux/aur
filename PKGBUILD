# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=picturesort
pkgver=0.3
pkgrel=1
pkgdesc="Sorts pictures on how they look, not by their metadata"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/$pkgname/"
license=('GPL')
depends=('fftw' 'gcc-libs' 'imagemagick')
source=(http://www.vanheusden.com/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('1d98b7a81ee2f94b4cf0ab70d3f35df6')

build() {
  cd $pkgname-$pkgver

  sed	-e 's|-O2||g' \
	-e 's|Graphics||g' \
	-i Makefile

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
