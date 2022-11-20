# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-shap
pkgver=0.41.0
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
url="https://github.com/slundberg/shap"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(i686 x86_64 armv7h aarch64)
source=("https://files.pythonhosted.org/packages/source/s/shap/shap-${pkgver}.tar.gz")
sha256sums=('a49ea4d65aadbc845a695fa3d7ea0bdfc8c928b8e213b0feedf5868ade4b3ca5')

build(){
    cd "shap-${pkgver}"
    python setup.py build
}

package(){
    cd "shap-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    # install -D LICENSE "${pkgdir}/usr/share/licenses/python-shap/LICENSE"
}
