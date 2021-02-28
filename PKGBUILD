# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python2-simplejson
pkgver=3.17.2
pkgrel=4
pkgdesc='Simple, fast, extensible JSON encoder/decoder for python2'
license=('MIT')
arch=('x86_64')
url='https://github.com/simplejson/simplejson'
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('59428640d43fdc6927db752a36196f48d00818a87d924358deab7e498709515423ecdd34dece31364c5e8d64b63d99112fd4a4b8a03b9f9c6533268afc38e314')

build() {
    cd "${srcdir}"/simplejson-${pkgver}

    python2 setup.py build
}

check() {
    cd "${srcdir}"/simplejson-${pkgver}

    python2 setup.py pytest
}

package_python2-simplejson() {
    cd simplejson-${pkgver}

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
