# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-twofish
_name=twofish
pkgver=0.3.0
pkgrel=1
pkgdesc="Bindings for the Twofish implementation by Niels Ferguson"
url="https://pypi.org/project/${_name}/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=("i686" "x86_64")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

sha256sums=('b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
