# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-linear-tsv"
_name=${pkgname#python-}
pkgdesc="Line-oriented, tab-separated value format"
url="https://github.com/solidsnack/tsv"

pkgver=1.1.0
pkgrel=2

arch=("any")
license=("APACHE")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://www.apache.org/licenses/LICENSE-2.0.txt"
)
sha256sums=(
    "b504d78f4075615ae75de86a16e5680701a441fc84da2a2cf9f94351ab1ccbf5"
    "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

}
