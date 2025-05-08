pkgbase='python-proglog'
pkgname=('python-proglog')
_module='proglog'
pkgver='0.1.11'
pkgrel=1
pkgdesc="Log and progress bar manager for console, notebooks, web..."
url=""
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ce35a0f9d1153e69d0063cdae6e6f2d8708fa0a588fc4e089501b77005e72884')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
