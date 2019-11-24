pkgbase='python-primesieve'
pkgname=('python-primesieve')
_module='primesieve'
pkgver='2.0.0'
pkgrel=1
pkgdesc=""
url="https://github.com/hickford/primesieve-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('da7d5f13e0c5949ef598642aa39fcd9aa84487b116d8ea7d5e3a47a6ed2936cb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
