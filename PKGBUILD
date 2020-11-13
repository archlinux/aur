# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
pkgver=7.4.2
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
source=("https://files.pythonhosted.org/packages/74/bc/ed9f5688f84435d1c1c4fe554ff1f84d634c6cf1c32b6e72e76e63c5c133/thinc-7.4.2.tar.gz")
sha256sums=('772f1a27b9b31e51003d1d2a7476cc49cc81044dd87088112237f93bd2091f0b')


build(){
    cd "thinc-${pkgver}"
    python setup.py build
}

package() {
    cd "thinc-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
