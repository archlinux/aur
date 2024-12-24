# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=shelved_cache
pkgname=python-shelved-cache
pkgver=0.4.0
pkgrel=2
pkgdesc="A persistent cache implementation for Python cachetools."
arch=('any')
url="https://github.com/mariushelf/shelved_cache"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python' 'python-cachetools')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('91871a6df12eead600b8c7cd08d0126ac0543dc4ffd78bf7abeead504f20282d')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
