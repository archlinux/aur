# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-api-python
_name=${pkgname#python-}
__name=${_name//-/_}
pkgver=2.1.7
pkgrel=1
pkgdesc="This is the official Python API client for the Todoist REST API."
arch=(any)
url="https://github.com/Doist/$_name"
license=('MIT')
groups=()
depends=(python-requests)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${__name::1}/$__name/$__name-$pkgver.tar.gz")
sha256sums=('84934a19ccd83fb61010a8126362a5d7d6486c92454c111307ba55bc74903f5c')

build() {
    cd "$srcdir/$__name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$__name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

