# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/be/ba/08c53c55cc97f62310ed83e1a4d91e424f221645c88c2dddd41f179fd1f7/wasabi-0.2.2.tar.gz")
sha256sums=('f92c83e728bf1db6dc859ffc861afa328d2da8ef0c7a19300e5fb1bd5762b277')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
