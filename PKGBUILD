# Maintainer: Louis Rannou <louson at gresille dot org>

_name=sitemap

pkgname=python-pelican-$_name
pkgdesc="Pelican plugin that generates a sitemap"
pkgver=1.1.0
pkgrel=1
url="https://github.com/pelican-plugins/${_name}"
license=('AGPL-3.0')
arch=('any')

depends=(python pelican)
makedepends=(python-build python-installer python-wheel python-poetry-core)

source=("https://github.com/pelican-plugins/${_name}/archive/refs/tags/${pkgver}.tar.gz")

md5sums=('ee34d66f96cfeb8e0456fa515dbcad8f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
