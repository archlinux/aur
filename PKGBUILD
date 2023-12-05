# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=fasttext
pkgdesc="Library for fast text representation and classification"
url="https://github.com/facebookresearch/fastText"

pkgver=0.9.2
pkgrel=3

arch=('x86_64')
license=('BSD')

depends=(
    "gcc12-libs"
)
optdepends=(
    "fasttext-langid-models"
)
makedepends=(
    "gcc12"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=("7ea4edcdb64bfc6faaaec193ef181bdc108ee62bb6a04e48b2e80b639a99e27e")

build() {
    cd "${srcdir}/fastText-${pkgver}"
    make CXX=g++-12
}

package() {
    install -Dm0755 "${srcdir}/fastText-${pkgver}/fasttext" "${pkgdir}/usr/bin/fasttext"
    install -Dm0644 "${srcdir}/fastText-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/fasttext/LICENSE"
}
