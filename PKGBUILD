# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
pkgver=7.4.1
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/explosion/thinc"
license=(MIT)
depends=(
    python-blis
    python-catalogue
    python-cymem
    python-hypothesis
    python-mock
    python-murmurhash
    python-numpy
    python-pathlib
    python-plac
    python-preshed
    python-pydantic
    python-six
    python-srsly
    python-tqdm
    python-wasabi
)
makedepends=(python-setuptools cython)
source=("https://files.pythonhosted.org/packages/17/5d/4343b3a79565af88ba2d53818d97995c3c239288f2565b826865f376d271/thinc-7.4.1.tar.gz")
sha256sums=('0139fa84dc9b8d88af15e648fc4ae13d899b8b5e49cb26a8f4a0604ee9ad8a9e')


build(){
    cd "thinc-${pkgver}"
    python setup.py build
}

package() {
    cd "thinc-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
