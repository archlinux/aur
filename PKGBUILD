# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-littleutils
_module='littleutils'
pkgver=0.2.2
pkgrel=2
pkgdesc="Small personal collection of python utility functions"
url="https://github.com/alexmojaki/littleutils"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('e6cae3a4203e530d51c9667ed310ffe3b1948f2876e3d69605b3de4b7d96916f'
            'dfe14f8798c400cbcc85bb4536a686c6fcf3086b3446c3f7c7054a2bcd73ca6a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
