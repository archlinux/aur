# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-py2nb
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=4
pkgdesc="Convert python scripts to jupyter notebooks"
arch=(any)
url="https://github.com/williamjameshandley/${_name}"
license=('GPL')
groups=()
depends=('jupyter-notebook')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(d250d734407d635288d38b8fd5ab434b9caa38047258fb4a567bd4feeb3248c9)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

