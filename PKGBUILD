pkgbase='python-monkeytype'
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='23.3.0'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f2595db34d57cdddbde5a990117a50a22f373dbb917a2a0fa91ffbe07dfe0313')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
