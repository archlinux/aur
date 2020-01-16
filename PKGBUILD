# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.6.0
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/39/69/4b5a64b25a18f5a05f33c6a4f0bd0fc9f117b6327e7c673548ae3a7c784f/wasabi-0.6.0.tar.gz")
sha256sums=('b8dd3e963cd693fde1eb6bfbecf51790171aa3534fa299faf35cf269f2fd6063')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
