# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-fasttext-predict
pkgdesc="fasttext with wheels and no external dependency, but only the predict method (<1MB)"
url="https://github.com/searxng/fasttext-predict"
provides=("python-fasttext-predict")
conflicts=("python-fasttext" "python-fasttest-git" "python-fasttext-predict-git")
pkgver=0.9.2.1
pkgrel=1
arch=("x86_64")
license=("MIT")
makedepends=("python-setuptools")
depends=("pybind11")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
b2sums=('dcf0cd0f34d6f90883016e823f4283922c9e7e20bde6bc6d41b5003bdd6029888d3b097d240ce08b83897f7162029c47938b76359ec4f518d5bec29063339359')

build() {
    cd "${srcdir}/fasttext-predict-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fasttext-predict-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
