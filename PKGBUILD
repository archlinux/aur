# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-anesthetic
_name=${pkgname#python-}
pkgver=2.5.0
pkgrel=1
pkgdesc="nested sampling post-processing"
arch=(any)
url="https://github.com/handley-lab/anesthetic"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(anesthetic)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e201247afb69507d4b64e8dd062edc8de5917814b4d68b6a5530d4410df06356')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

