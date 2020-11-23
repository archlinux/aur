# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
pkgver=7.4.3
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
source=("https://files.pythonhosted.org/packages/25/99/e21c2a1622c193b2c93a628496fea4525a0ce93e3b47f3cb06559b6ff3ee/thinc-7.4.3.tar.gz")
sha256sums=('c98491b083165f48bda95f5533f7d9dbd3980d32ad621bfe579ff08ef625a4d3')

build() {
    cd "thinc-${pkgver}"
    python setup.py build
}

package() {
    cd "thinc-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
