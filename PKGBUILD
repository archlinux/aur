# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-shap
pkgver=0.35.0
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
url="https://github.com/slundberg/shap"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(i686 x86_64 armv7h aarch64)
source=("https://files.pythonhosted.org/packages/a8/77/b504e43e21a2ba543a1ac4696718beb500cfa708af2fb57cb54ce299045c/shap-0.35.0.tar.gz")
sha256sums=('6b9a2a3636918b9cdce4d3c599786b38353fbdca49147b5407a75aee398b1018')

build(){
    cd "shap-${pkgver}"
    python setup.py build
}

package(){
    cd "shap-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    # install -D LICENSE "${pkgdir}/usr/share/licenses/python-shap/LICENSE"
}
