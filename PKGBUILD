# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
pkgver=0.7.2
pkgrel=1
pkgdesc="Fast matrix-multiplication as a self-contained Python library"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/explosion/cython-blis"
license=(MIT)
depends=(
     cython
     python-numpy
     python-pytest
     python-hypothesis
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/06/43/345e98e2895aaabda2992b9c1c5fbbd0a89d9443d825ce49583086f9bba6/blis-0.7.2.tar.gz")
sha256sums=('c14fb9ec3f5ed7c4940c132c7691469ac5d3e302891d95e935623bf1d4e17fbb')


build() {
    cd "blis-${pkgver}"
    python setup.py build
}

package() {
    cd "blis-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
