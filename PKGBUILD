# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=2.2.5
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_md"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('bee7af9b66f2542139fe5e206d48d1df98d19e6f5b6a0f7d14fa96a304dd62f4')

build() {
    cd en_core_web_md-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
