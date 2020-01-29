# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname=python-async_lru
_module='async_lru'
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple lru_cache for asyncio"
url="https://github.com/aio-libs/async_lru"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
provides=('python-async-lru')
conflicts=('python-async-lru')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('baa898027619f5cc31b7966f96f00e4fc0df43ba206a8940a5d1af5336a477cb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
