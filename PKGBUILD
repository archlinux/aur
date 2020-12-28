# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-medium'
pkgname=('python-medium')
_module='medium'
pkgver='0.3.0'
pkgrel=1
pkgdesc="SDK for working with the Medium API"
url="https://github.com/Medium/medium-sdk-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0712a3e6c99467c97a46b0c7ef6ba0dec079018fc40f6093dc98d95c05ece7fd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
