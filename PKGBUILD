# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-python
_name=${pkgname#python-}
pkgver=8.1.4
pkgrel=1
pkgdesc="The official Todoist Python API library"
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('46483a7922e241ef0365a56ed8312794a2def112e44702a6a70f936988fe969d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

