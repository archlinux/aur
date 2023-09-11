# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-margarine
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=2
pkgdesc="Posterior Sampling and Marginal Bayesian Statistics"
arch=(any)
url="https://github.com/htjb/margarine"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(4680a79b0b66a0fdb37e21e217e3bc7cbbf8e4a1d6cf19defabdec12ba976812)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

