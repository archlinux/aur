# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=shelved_cache
pkgname=python-shelved-cache
pkgver=0.5.0
pkgrel=1
pkgdesc="A persistent cache implementation for Python cachetools."
arch=('any')
url="https://github.com/mariushelf/shelved_cache"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python' 'python-cachetools')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('7b55f1fdcb05d6a6ba6aabb283940f8aec5342e9cd3f9d3758c2700282cf788b064447e4d8eda7896899285886d0e327aa1f54306e897e7ccc7ef6d2ff68d376')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
