# Maintainer: Louis Rannou <louson at gresille dot org>

_name=pandoc-reader

pkgname=python-pelican-$_name
pkgdesc="Pelican plugin that converts documents written in Pandoc's markdown"
pkgver=2.1.0
pkgrel=1
url="https://github.com/pelican-plugins/${_name}"
license=('AGPL-3.0')
arch=('any')

depends=(python pelican)
makedepends=(python-build python-installer python-wheel python-poetry-core)

source=("https://github.com/pelican-plugins/${_name}/archive/refs/tags/${pkgver}.tar.gz")

md5sums=('80cca2421643c0496f7d5d5983a7db32')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
