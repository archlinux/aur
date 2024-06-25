# Maintainer: Louis Rannou <louson at gresille dot org>

python=python
name=mbzero

pkgname=$python-$name
pkgdesc="Python bindings for the MusicBrainz web service (WS/2)"
pkgver=0.4
pkgrel=1
url="https://gitlab.com/Louson-public/mbzero/python-mbzero"
license=('BSD2')
arch=('any')

depends=(python python-authlib python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)

source=("https://gitlab.com/mbzero/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

md5sums=('ff624aec50f8b9fc645429cb4b3d90c3')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
