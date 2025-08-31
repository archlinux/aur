# Maintainer: xuhcc <xuhcc@cryptolab.net>
# Contributor: Radu Potop <radu at wooptoo com>

origname=bumpver
pkgname=python-bumpver
pkgver=2025.1131
pkgrel=1
pkgdesc='Automatic versioning for Python packages'
arch=(any)
url="https://github.com/mbarkhau/$origname"
license=("MIT")
depends=(
    "python-toml"
    "python-lexid"
)
makedepends=(
    "python-astor"
    "python-build"
    "python-installer"
    "python-lib3to6"
    "python-pathlib2"
)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "$origname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$origname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('49a9713fa64475c1f86e8943639c2cc23937b1339bf47776f724b1b2ceaad4a7')
