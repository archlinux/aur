# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=2.3.1
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('06c80936324012d1223291d2af41a5229e746dc2dee8fe31a532666ee3d18aaa')

build() {
    cd en_core_web_sm-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
