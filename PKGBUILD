# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-geonamescache"
_pkgname="geonamescache"
pkgver=1.0.2
pkgrel=1
pkgdesc="A Python library that provides functions to retrieve names, ISO and FIPS codes of continents, countries as well as US states and counties as Python dictionaries. The country and city datasets also include population and geographic data."
arch=('any')
url="https://github.com/yaph/geonamescache"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/bc/8d/adc59b775c1c65e62e932c2caf4530c8d1eb8ec9167af1345030f5dfad2c/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d34c61286c6e5d9e387e1afec24164921bf197516bb99ee2ce4557adfd492263')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
