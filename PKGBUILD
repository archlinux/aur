# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-dynesty
_name=${pkgname#python-}
pkgver=2.1.4
pkgrel=1
pkgdesc="A dynamic nested sampling package for computing Bayesian posteriors and evidences."
arch=(any)
url="https://github.com/joshspeagle/dynesty"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
    python-numpy
    python-scipy
    python-matplotlib
)
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(cd98cfded1af86487b76dba2bd89824c803f1e0c451fcb14a0b208c5ca1a8004)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

