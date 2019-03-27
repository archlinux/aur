# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=2.1.0
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_sm"
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('4db16860a8cdef56d436038ace6abeb9181a5176bdc8c16c755a20dced51e5f1')

build() {
    cd en_core_web_sm-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
