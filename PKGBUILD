# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-api-python
_name=${pkgname#python-}
__name=${_name//-/_}
pkgver=4.0.0
pkgrel=1
pkgdesc="This is the official Python API client for the Todoist REST API."
arch=(any)
url="https://github.com/Doist/$_name"
license=('MIT')
groups=()
depends=(python-httpx python-dataclass-wizard python-annotated-types)
makedepends=(python-build python-installer python-hatchling)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${__name::1}/$__name/$__name-$pkgver.tar.gz")
sha256sums=('2e8acbaa4ea7aae05a640bd24690ca020ef8044610b0dcf4df85b8a788a43872')

build() {
    cd "$srcdir/$__name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$__name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

