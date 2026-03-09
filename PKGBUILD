# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-api-python
_name=${pkgname#python-}
__name=${_name//-/_}
pkgver=3.2.1
pkgrel=1
pkgdesc="This is the official Python API client for the Todoist REST API."
arch=(any)
url="https://github.com/Doist/$_name"
license=('MIT')
groups=()
depends=(python-requests python-dataclass-wizard python-annotated-types)
makedepends=(python-build python-installer python-poetry)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${__name::1}/$__name/$__name-$pkgver.tar.gz")
sha256sums=('22c60230cc616437846f9a6469dddd97548545ef916d2bea98b2ca2f522d92f9')

build() {
    cd "$srcdir/$__name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$__name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

