# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.7.1
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/4e/d1/a23917773a5759b36d1dc8433d15fb40700ca29d5ba924d6350c38a8ef8e/wasabi-0.7.1.tar.gz")
sha256sums=('ee3809f4ce00e1e7f424b1572c753cff0dcaca2ca684e67e31f985033a9f070b')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
