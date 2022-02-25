# Maintainer: rern <rernrern@gmail.com>

# get srcurl: https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/ > Download Snapshot
# mkdir $pkgnamever
# bsdtar --strip 1 -C $pkgnamever -xf raspberry-gpio-python*.zip
# bsdtar -cjf $pkgnamever.tar.xz $pkgnamever


pkgname=python-rpi-gpio
pkgver=0.7.1
pkgrel=1
pkgnamever=$pkgname-$pkgver
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-distribute)
srcurl=https://github.com/rern/rern.github.io/releases/download/20210307/$pkgnamever.tar.xz
source=("$srcurl")
sha256sums=('ac087d76c331e9f5d66616f178aff8628f79f3fd1e05f44fad4cc935a49b709a')

package() {
	mv -f "$srcdir/$pkgnamever" "$srcdir/RPi.GPIO-$pkgver"
	cd "$srcdir/RPi.GPIO-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
