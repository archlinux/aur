# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-spacy
pkgver=2.3.2
pkgrel=1
pkgdesc="Free open-source library for Natural Language Processing in Python"
arch=(i686 x86_64 armv7h aarch64)
url="https://spacy.io/"
license=(MIT)
depends=(
    python-catalogue
    python-cymem
    python-murmurhash
    python-numpy
    python-pathlib
    python-plac
    python-preshed
    python-regex
    python-requests
    python-srsly
    python-thinc
    python-tqdm
    python-ujson
    python-wasabi
)
makedepends=(python-wheel cython)
source=("https://files.pythonhosted.org/packages/18/db/499f374339b522b6618234b93f25d2990692795ccce3152519ccc508586c/spacy-2.3.2.tar.gz")
sha256sums=('818de26e0e383f64ccbe3db185574920de05923d8deac8bbb12113b9e33cee1f')


build() {
    cd "spacy-${pkgver}"
    python setup.py build
}

package() {
    cd "spacy-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
