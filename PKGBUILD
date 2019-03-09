# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=2.1.0a7
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_md"
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('f54a6e6a2ff34c1adb1a2eabeb67b170933453ed878125c76813dc2e31c8cf8a')

build(){
    cd en_core_web_md-${pkgver}
    python setup.py build
}

package(){
    cd en_core_web_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
