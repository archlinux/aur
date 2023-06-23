# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-dynesty
_name=${pkgname#python-}
pkgver=2.1.2
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
sha256sums=(c5c17472c92f0372bf795534e65e3a170e2228afe9c6cbace0d0b5772f9a8bbb)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

