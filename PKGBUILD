# Submitter: peippo <christoph+aur@christophfink.com>
# Maintainer: Liam Timms <timms5000 @ g mail dot com>

pkgname="python-hdbscan"
_name=${pkgname#python-}
pkgdesc="Hierarchical Density-Based Spatial Clustering of Applications with Noise"
url="http://github.com/scikit-learn-contrib/hdbscan"

pkgver=0.8.29
pkgrel=1

arch=("x86_64")
license=("BSD")

makedepends=(
    "python-setuptools"
    "cython"
)
depends=(
    "python"
    "python-numpy"
    "python-scipy"
    "python-scikit-learn"
    "python-joblib"
    "python-six"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=('7e9d7351610eaadddb281e3149a74e22e329bc0b5325f631031d4b63a6a770ae')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
