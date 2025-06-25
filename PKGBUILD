# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-fasttext-predict
pkgdesc="fasttext with wheels and no external dependency, but only the predict method (<1MB)"
url="https://github.com/searxng/fasttext-predict"
conflicts=("python-fasttext" "python-fasttest-git" "python-fasttext-predict-git")
pkgver=0.9.2.4
pkgrel=2
arch=("x86_64")
license=("MIT")
makedepends=("python-setuptools" "pybind11")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
b2sums=('992c056f5654baac801aea0a69bfb2b7a94d8b4053eb4e64f0f8395abeaaa893e4dbbf15eb198d552c233d3bc754ec9ea492d49e9ac7e0e142da00beee780134')

build() {
    cd "${srcdir}/fasttext-predict-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fasttext-predict-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
