# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-codetiming
pkgver=1.2.0
pkgrel=1
pkgdesc="A flexible, customizable timer for your Python code"
url="https://pypi.org/project/codetiming/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/92/a5/990e22c3f67e26db8e7dbbf58dc503748b7dca58ab2fda876fa69d30b04c/codetiming-1.2.0.tar.gz")
sha256sums=('bc0d19fedfc66c8f8ffd2245d2bd5ae88005ecff5f740a67c9cc776083db4a8e')

build(){
    cd "codetiming-${pkgver}"
    python setup.py build
}

package(){
    cd "codetiming-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-codetiming/LICENSE"
}
