pkgbase='python-authlib'
pkgname=('python-authlib')
_module='Authlib'
pkgver='0.11'
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers."
url="https://authlib.org/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9741db6de2950a0a5cefbdb72ec7ab12f7e9fd530ff47219f1530e79183cbaaf')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
