pkgbase='python-simpervisor'
pkgname=('python-simpervisor')
_module='simpervisor'
pkgver='0.4'
pkgrel=1
pkgdesc="Simple async process supervisor"
url="https://github.com/yuvipanda/simpervisor"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('cec79e13cdbd6edb04a5c98c1ff8d4bd9713e706c069226909a1ef0e89d393c5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
