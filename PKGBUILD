pkgbase='python-authlib'
pkgname=('python-authlib')
_module='Authlib'
pkgver='0.13'
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers."
url="https://authlib.org/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('401a4a184379a6551b79af30243ce1ad56da0a8da5b4925e0be260f07ee40009')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
