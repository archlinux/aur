# Maintainer: Oliver Harley <oliver.r.harley+aur (at) gmail.com >

pkgbase=('python-tensorflow-lucid')
pkgname=('python-tensorflow-lucid')
_module=lucid
pkgver='0.3.8'
pkgrel=1
pkgdesc="Collection of infrastructure and tools for research in neural network interpretability."
url="https://github.com/tensorflow/lucid"
depends=('python' 'tensorflow')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')

source=("$_module-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('d94daf5c7fc9472d284296ba842f4e1b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
