# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-propka
_name=${pkgname#python-}
pkgver=3.5.0
pkgrel=1
pkgdesc="Heuristic pKa calculations with ligands"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=('LGPL2.1')
depends=('python>=3.8')
checkdepends=('python-numpy' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0f32bbcafed56e94cc9d3fdb05d9c2faa7485d8a5779aaa79049b9ce0ab052fa')
options=(!emptydirs)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

