pkgbase='python-oelint-parser'
pkgname=('python-oelint-parser')
_module='oelint-parser'
pkgver='3.4.0'
pkgrel=1
pkgdesc="Alternative parser for bitbake recipes"
url="https://github.com/priv-kweihmann/oelint-parser"
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD-2-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('92733154189b697df02bb54d04e0c778b7806c13971ca35bcb18c8b6235c21fc')

build() {
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
