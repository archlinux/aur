# Maintainer: rern <rernrern@gmail.com>

# get srcurl: https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/ > Download Snapshot

srcurl=https://github.com/rern/rern.github.io/releases/download/20210307/raspberry-gpio-python-0.7.1.tar.xz

pkgname=python-rpi-gpio
pkgver=0.7.1
pkgrel=1
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-distribute)
source=("$srcurl")
sha256sums=('c3c779fd4154d17c0c29303e926aa4831ad975967aa55c8e03b991519f2d465e')

package() {
	mv -f "$srcdir/$( basename $srcurl .zip )" "$srcdir/RPi.GPIO-$pkgver"
	cd "$srcdir/RPi.GPIO-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
