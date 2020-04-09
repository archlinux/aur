# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=python-rpdb
_pkgname=rpdb
pkgver=0.1.6
pkgrel=1
pkgdesc="python remote debugger based on pdb"
arch=("any")
url="https://pypi.org/project/rpdb/"
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
source=("https://github.com/tamentis/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('420032fe6d25fb306e5c1cba638904e7ec14c284f6c6f2a5d866790ae19c1c9e')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
