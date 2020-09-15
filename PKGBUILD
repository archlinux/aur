# python-alabaster

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-alabaster
_pkgname=${pkgname#*-}
pkgver=0.7.12
pkgrel=1
pkgdesc='A configurable sidebar-enabled Sphinx theme.'
arch=('any')
url='https://alabaster.readthedocs.io/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitprophet/alabaster/archive/$pkgver.tar.gz")
sha256sums=('2f413c2a7e16f6b18d38f86a236b89e50e5f6ca79094ff948e5e58828f95c430')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

