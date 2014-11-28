# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=picturesort
pkgver=0.2
pkgrel=1
pkgdesc="Sorts pictures on how they look, not by their metadata"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/$pkgname/"
license=('GPL')
depends=('fftw' 'gcc-libs' 'imagemagick')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('f92580b48bf858207b17603124db449e')

build() {
  cd $pkgname-$pkgver

  sed	-e 's|-O2||g' \
	-e 's|Graphics||g' \
	-i Makefile

  make || return 1
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
