# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pkgname=aiowinreg
pkgver=0.0.12
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://github.com/skelsec/aiowinreg"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/skelsec/aiowinreg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c51a0a211e68a9eb410dd296b7d0956e5d814154ed15ef0fd837a155c91b5eca')

build() {
    cd "${_pkgname}-${pkgver}"
    rm -rf tests # conflicts with other packages
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
