# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=python-plexapi-girens
_name="PlexAPI 'Girens Fork"
pkgver=3.0.6
pkgrel=1
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/tijder/python-plexapi"
license=('BSD')
depends=('python-requests' 'python-tqdm' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("python-plexapi")
conflicts=("python-plexapi")
source=("https://github.com/tijder/python-plexapi/archive/refs/tags/3.0.6.tar.gz")
sha256sums=('d43947afb640d47a12525fea24c9d9e1afc80e7fbc7991666184bd942dae130d')

prepare() {
  mv "python-plexapi-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
