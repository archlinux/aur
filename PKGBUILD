# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiowinreg
_pkgname=aiowinreg
pkgver=0.0.9
pkgrel=1
pkgdesc="Windows registry file reader, written in python"
url="https://github.com/skelsec/aiowinreg"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/skelsec/aiowinreg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('55b59dec411661d7042a9a7f4091a6ce83483f701fea517e91ced22643bfa92e')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
