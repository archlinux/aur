# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
pkgver=2.0.0
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_md"
makedepends=('python-setuptools')
license=('CC BY-SA 3.0')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_md-${pkgver}/en_core_web_md-${pkgver}.tar.gz")
sha256sums=('ec77172fd76e21766c0aeaac2daf2c9d314a6f88f45d209d43f5bfa0ea2bafac')

build(){
    cd en_core_web_md-${pkgver}
    python setup.py build
}

package(){
    cd en_core_web_md-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
