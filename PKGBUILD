# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
_name=pycdlib
pkgver=1.14.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5bab585e0e864198cf8b5ba08c78ffaa8d2365fa549b4efe9919072f65ad677801cdf03a3243a0f188c56c82fa29a5e97428d1e8b361d29da41b4d2ebc197f3c')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
