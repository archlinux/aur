# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-unimpeded
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Universal model comparison & parameter estimation over diverse datasets"
arch=(any)
url="https://github.com/handley-lab/unimpeded"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(unimpeded)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1a6d860d68de7f71b0227e7f4bbf3e6c962ccfa2ab269c9a22997a4a8a1fe990')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

