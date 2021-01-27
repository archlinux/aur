# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-geonamescache"
_pkgname="geonamescache"
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python library that provides functions to retrieve names, ISO and FIPS codes of continents, countries as well as US states and counties as Python dictionaries. The country and city datasets also include population and geographic data."
arch=('any')
url="https://github.com/yaph/geonamescache"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/b7/14/496060518f2390d1cda1c94907250f0b0c2ffa0dfad1f3d8006258b70dc9/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('40f92d4de21f7b7e49b352c2cb150735067c924d86f37626a17f998eb40e2e94')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
