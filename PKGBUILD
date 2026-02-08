# Maintainer: Deon Spengler <deon@spengler.co.za>
# Contributor: éclairevoyant
# Contributor: Gabriele Musco <emaildigabry at gmail dot com>

pkgname=python-openrgb
pkgver=0.3.6
pkgrel=1
pkgdesc="Python client for the OpenRGB SDK"
arch=(any)
license=(GPL-3.0-only)
depends=(openrgb python)
makedepends=(git python-setuptools)
source=("https://github.com/jath03/openrgb-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('685e577593c606f130b592fb4ddaad7fe9941aa306f93b052e2b86824bafe7fd')

build() {
    cd "openrgb-python-${pkgver}"
	python setup.py build
}

package() {
    cd "openrgb-python-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
