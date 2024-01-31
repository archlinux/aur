pkgbase='python-oelint-parser'
pkgname=('python-oelint-parser')
_module='oelint-parser'
pkgver='3.0.2'
pkgrel=1
pkgdesc="Alternative parser for bitbake recipes"
url="https://github.com/priv-kweihmann/oelint-parser"
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('a60713887bf6eadb54ff08741adf9284')

build() {
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
