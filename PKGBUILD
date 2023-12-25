pkgbase='python-oelint-parser'
pkgname=('python-oelint-parser')
_module='oelint-parser'
pkgver='2.12.2'
pkgrel=1
pkgdesc="Alternative parser for bitbake recipes"
url="https://github.com/priv-kweihmann/oelint-parser"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('609e882bf52a0b52391a5bc4ee690039b185d80e473dd22b6905abcf89718aef')

build() {
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
