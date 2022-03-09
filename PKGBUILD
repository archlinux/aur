# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=todoist-api-python
pkgname=python-$_modulename
pkgver=1.1.0
pkgrel=1
pkgdesc="This is the official Python API client for the Todoist REST API."
arch=(any)
url="https://github.com/Doist/$_modulename"
license=('BSD')
groups=()
depends=(python-requests)
makedepends=(python-build python-installer python-poetry)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('177abf9fbbb9f3f7d8cbcebc5ec8e2b37bd9c7e72b7682805d5647bf18b26eb8')

build() {
    cd "$srcdir/$_modulename-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_modulename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

