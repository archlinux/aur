# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python2-simplejson
pkgver=3.17.4
pkgrel=1
pkgdesc='Simple, fast, extensible JSON encoder/decoder for python2'
license=('MIT')
arch=('x86_64')
url='https://github.com/simplejson/simplejson'
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('16c16aea5e591cecd272e27d731fbb27f6f31c135e43c201daf476da38df384cfa60422b11eac1cb305ff62ad23e4c7da117803b5f2590046f0f74c7bbc7332d')

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
