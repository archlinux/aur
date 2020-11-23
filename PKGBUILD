# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-blis
pkgver=0.7.3
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
source=("https://files.pythonhosted.org/packages/3b/5b/7f15e2db542e3df9ff04cf21a54d4e89ed778453fcb47cff1e4ee8636a6e/blis-0.7.3.tar.gz")
sha256sums=('19557b14763253ca3d4f6cfc9c9fe2eed3d65db14fa273ced8b0c17ce2bfda4a')

build() {
    cd "blis-${pkgver}"
    python setup.py build
}

package() {
    cd "blis-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
