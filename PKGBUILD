# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python2-simplejson
pkgver=3.17.3
pkgrel=1
pkgdesc='Simple, fast, extensible JSON encoder/decoder for python2'
license=('MIT')
arch=('x86_64')
url='https://github.com/simplejson/simplejson'
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('eb8bae7cb14b9f3cdcc0fe8ce7fc9edde09099c054d6335d0afc26cfaa16657d580b095fd8879bb48856be82050824015e9636942dafe95c888ee2db43adfb97')

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
