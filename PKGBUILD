# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pfs
_name=${pkgname#python-}
pkgver=0.6.1
pkgrel=4
pkgdesc="tool for \"git submodule foreach\" execution in parallel"
arch=(any)
url="https://github.com/stt-systems/parallel_foreach_submodule"
license=('LGPL')
groups=()
depends=()
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(9c1c344495ca225a2ff95f20f3919f287423a38c1d5457a5afb7334eb575a319)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

