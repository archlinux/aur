# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=2.0.0
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_sm"
makedepends=('python-setuptools')
license=('CC BY-SA 3.0')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('9d9d231d7c9cbad82178b566fdb25768e3d5098af23ce11e03ec4f432f4a2298')

build(){
    cd en_core_web_sm-${pkgver}
    python setup.py build
}

package(){
    cd en_core_web_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
