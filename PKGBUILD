pkgbase='python-bloom'
pkgname=('python-bloom')
_module='bloom'
pkgver='0.10.7'
pkgrel=1
pkgdesc="Bloom is a release automation tool."
url="http://www.ros.org/wiki/bloom"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7038093de4448e0d8f172d0334c3089f77cbe7f7151ea59e2b7c0d9ea4033e8e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
