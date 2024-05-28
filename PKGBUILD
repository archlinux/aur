# Maintainer: Louis Rannou <louson at gresille dot org>

python=python
name=mbzero

pkgname=$python-$name
pkgdesc="Python bindings for the MusicBrainz web service (WS/2)"
pkgver=0.3
pkgrel=1
url="https://gitlab.com/Louson-public/mbzero/python-mbzero"
license=('BSD2')
arch=('any')

depends=(python python-authlib python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)

source=("https://gitlab.com/mbzero/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

md5sums=('e7beaa96ee0b356536be3ce33042cb36')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
