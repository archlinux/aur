pkgbase='python-proglog'
pkgname=('python-proglog')
_module='proglog'
pkgver='0.1.9'
pkgrel=2
pkgdesc="Log and progress bar manager for console, notebooks, web..."
url=""
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d8c4ccbf2138e0c5e3f3fc0d80dc51d7e69dcfe8bfde4cacb566725092a5b18d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
