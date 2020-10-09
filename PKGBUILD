# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=2.3.1
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_md"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('904c7b8ac18b045898d34195c9dc8aee3b94ca019d25cd20eab3a94d8aa2e515')

build() {
    cd en_core_web_md-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
