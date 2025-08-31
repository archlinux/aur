# Maintainer: xuhcc <xuhcc@cryptolab.net>
# Contributor: Radu Potop <radu at wooptoo com>

origname=lib3to6
pkgname=python-lib3to6
pkgver=202110.1050
subver=b0
pkgrel=1
pkgdesc='Build universally compatible Python packages from a substantial subset of Python 3.8'
arch=(any)
url="https://github.com/mbarkhau/$origname"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("${url}/archive/refs/tags/v${pkgver}-${subver}.tar.gz")

build() {
    cd "$origname-$pkgver-$subver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$origname-$pkgver-$subver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('7a06fb724473dda87ccea6e84b251f20a6bb4cc9679b7e05e0e5116be701706a')
