# Contributor: Louis Rannou <louson at gresille dot org>

python=python
name=musicbrainzez

pkgname=$python-$name
pkgver=1.1
pkgrel=1
pkgdesc="Python bindings for the MusicBrainz web service (WS/2)"
url="https://gitlab.com/Louson/python-musicbrainzez"
license=('BSD2')
arch=('any')
makedepends=(python-build python-installer python-wheel)
depends=(python python-authlib python-requests)
provides=(python-musicbrainzngs)
conflicts=(python-musicbrainzngs)
source=("https://gitlab.com/Louson/${pkgname}/-/archive/v${pkgver}/python-musicbrainzez-v${pkgver}.tar.bz2")
md5sums=('de9a32e68690fc76ebf97c66a7676bff')

build() {
    cd "$pkgname-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
