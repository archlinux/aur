# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast matrix-multiplication as a self-contained Python library"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/explosion/cython-blis"
license=(MIT)
depends=(cython
         python-numpy
         python-pytest
         python-hypothesis)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/d2/85/b96045fcbd87c8e2e06c7dcd069ccb97e1bf5b6778e0e609a7f965b87e39/blis-0.7.1.tar.gz")
sha256sums=('014771a0f753a64ef5610c5b3d4a090b263073bdd59b8ad0d872ce1e06e7315a')


build(){
    cd "blis-${pkgver}"
    python setup.py build
}

package() {
    cd "blis-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
