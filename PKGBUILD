# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python2-simplejson
pkgver=3.17.5
pkgrel=1
pkgdesc='Simple, fast, extensible JSON encoder/decoder for python2'
license=('MIT')
arch=('x86_64')
url='https://github.com/simplejson/simplejson'
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('cfde404fd896030a65749f2c29c9d9e603e51c90b977777caa7749d8fa0c400ff6cf7d49c23afd650aaffddaa6407ac6d68454caa0ea703410a84f38cb6a5bed')

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
