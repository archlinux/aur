# Maintainer: Devaev Maxim <mdevaev@gmail.com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>


pkgname=python-raspberry-gpio
pkgver=0.7.0
pkgrel=2
pkgdesc="Python library for GPIO access on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(armv6h armv7h aarch64)
depends=(python)
makedepends=(gcc python-distribute)
source=("https://files.pythonhosted.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz")
sha1sums=(427089f39f13954c09d09a6a08a9249173fb8a17)


package() {
	cd "$srcdir/RPi.GPIO-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
