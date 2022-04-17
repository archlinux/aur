# Maintainer: rern <rernrern@gmail.com>

# get source: https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/ > Download Snapshot
# mkdir $pkgname-$pkgver
# bsdtar --strip 1 -C $pkgname-$pkgver -xf raspberry-gpio-python*.zip
# bsdtar -cjf $pkgnamever.tar.xz $pkgname-$pkgver


pkgname=python-rpi-gpio
pkgver=0.7.1
pkgrel=1
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python python-distribute)
source=(https://github.com/rern/rern.github.io/releases/download/20210307/$pkgname-$pkgver.tar.xz)
sha256sums=(c4acb800fea3e256e95b6aa7de152ab7d20f5567954df3016dcef141b33d86bd)

package() {
	mv -f $srcdir/$pkgname "$srcdir/RPi.GPIO-$pkgver"
	cd "$srcdir/RPi.GPIO-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
