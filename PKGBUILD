# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname=python-karney
pkgver=1.1.0
pkgrel=1
pkgdesc="Solves the direct and inverse geodesic problem"
arch=('any')
url="https://github.com/pbrod/karney"
license=('custom')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-pdm-pep517')
optdepends=()
source=("https://github.com/pbrod/karney/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4a0cf4e28f614c2148ddea3bbff7758a04fa403af6fa709bf3a35a0ef11d7705')
validpgpkeys=()

build() {
    cd "karney-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "karney-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
