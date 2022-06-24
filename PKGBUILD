# Maintainer: rern <rernrern@gmail.com>

# get source: https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/ > Download Snapshot
# mkdir $pkgname-$pkgver
# bsdtar --strip 1 -C $pkgname-$pkgver -xf raspberry-gpio-python*.zip
# bsdtar -cjf $pkgname-$pkgver.tar.xz $pkgname-$pkgver


pkgname=python-rpi-gpio
pkgver=0.7.1
pkgrel=1
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python python-distribute)
source=(https://github.com/rern/rern.github.io/raw/main/python-rpi-gpio/$pkgname-$pkgver.tar.xz)
sha256sums=('2db2b11bd150b9f4779de02fd807681a9acd8a31c1063287eb3bbdfba96227d5')

package() {
	mv -f $srcdir/{$pkgname,RPi.GPIO}-$pkgver
	cd $srcdir/RPi.GPIO-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}
