# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-py2nb
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Convert python scripts to jupyter notebooks"
arch=(any)
url="https://github.com/williamjameshandley/${_name}"
license=('GPL')
groups=()
depends=(jupyter-notebook)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('829d239ab0dc2f7b8769eb38faa8c122b1214741038ee46f4d72bd21e7097ba1')
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

