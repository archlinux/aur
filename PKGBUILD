pkgbase='python-oelint-parser'
pkgname=('python-oelint-parser')
_module='oelint-parser'
pkgver='3.3.1'
pkgrel=1
pkgdesc="Alternative parser for bitbake recipes"
url="https://github.com/priv-kweihmann/oelint-parser"
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('faed308449f30395d996a813a50b461f6e7f92b2cbbcd3f27165f305479d3117')

build() {
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
