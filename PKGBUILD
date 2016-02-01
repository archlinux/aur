# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=storj-dataserv-client
_pkgname=${pkgname/storj-/}
pkgver=2.1.4
pkgrel=3
pkgdesc="Storj Client for storing and auditing data"
url="https://github.com/Storj/dataserv-client"
depends=('python' 'python-setuptools' 'python-future' 'python-randomio' 'python-partialhash' 'python-btctxstore' 'python-psutil' 'python-storjcore')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b7bc917fc4434a978835b0dc99edac423d3f65ba91176a95f64a1651bc27ea7faa2d2d568bfe6f7bb5cbb13ee80fd6db85dd02376a483ee03cddc712931aa4e8')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

