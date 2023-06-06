# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=python-plexapi
_name="PlexAPI"
pkgver=4.14.0
pkgrel=1
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/pkkid/python-plexapi"
license=('BSD')
depends=('python-requests' 'python-tqdm' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fc62b16fbf80e382e9a1e69064e6a003a7d3099f90622c56e4a06e2a6e1cc4b9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
