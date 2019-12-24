# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.4.2
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/33/c5/b999502e0b925d1f37730abd412ec2e626348040722e2c86d0f3f9dc898c/wasabi-0.4.2.tar.gz")
sha256sums=('9af48b37709000dac34653be376aaac2e3e15392b8c78d0898124c52e083d088')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
