# Maintainer: rern <rernrern@gmail.com>

# get pkgurl:
#   - https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/
#   - Download Snapshot > right-click "direct link" - Copy link address (must click once at least)

pkgurl=https://sourceforge.net/code-snapshots/hg/r/ra/raspberry-gpio-python/code/raspberry-gpio-python-code-08048dd1894a6b09a104557b6eaa6bb68b6baac5.zip

pkgname=python-rpi-gpio
pkgver=0.7.1a4
pkgrel=1
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-distribute)
source=("$pkgurl")
sha256sums=('52ab34a0c00576fce5b572caf94ede316f9f8dffae08d14885ccd4d12811371f')

package() {
	mv -f "$srcdir/$( basename $pkgurl .zip )" "$srcdir/RPi.GPIO-$pkgver"
	cd "$srcdir/RPi.GPIO-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
