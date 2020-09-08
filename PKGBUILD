# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/7c/a8/b283a0e35a1b9249f373bcec9ad66defbc6f353f25297349979e828be1fc/wasabi-0.8.0.tar.gz")
sha256sums=('75fec6db6193c8615d7f398ae4aa2c4ad294e6e3e81c6a6dbbbd3864ee2223c3')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
