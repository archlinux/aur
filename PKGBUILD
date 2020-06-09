# Maintainer: Jose Riha <jose1711 gmail com>

pkgbase='python-msgcheck'
pkgname=('python-msgcheck')
_module='msgcheck'
pkgver=3.1
pkgrel=1
pkgdesc="Gettext file checker."
url="https://github.com/flashcode/msgcheck"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ef77ada3d9a32dd454cd90bebf216e3e3376bd30354be9f1b15ea50148f071ff')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
