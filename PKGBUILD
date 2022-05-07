pkgbase='python-proglog'
pkgname=('python-proglog')
_module='proglog'
pkgver='0.1.10'
pkgrel=1
pkgdesc="Log and progress bar manager for console, notebooks, web..."
url=""
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('658c28c9c82e4caeb2f25f488fff9ceace22f8d69b15d0c1c86d64275e4ddab4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
