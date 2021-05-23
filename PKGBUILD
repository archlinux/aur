pkgbase='python-monkeytype'
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='21.5.0'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e47089f032e65f9bc7b4146725285837b75136f28e3025b434d494f6d1b3cb87')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
