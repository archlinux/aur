# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/04/e5/aa1892776a8ed6f6d552ba1be0640e6403f07e850d36e79f475f1e605aa9/wasabi-0.7.0.tar.gz")
sha256sums=('e875f11d7126a2796999ff7f092195f24005edbd90b32b2df16dde5d392ecc8c')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
