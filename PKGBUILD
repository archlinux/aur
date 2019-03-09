# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_sm
pkgver=2.1.0a7
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/en#section-en_core_web_sm"
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-${pkgver}/en_core_web_sm-${pkgver}.tar.gz")
sha256sums=('0b6264abb56aa6163dc431c98f625791945f225738c0906c09abfd763f655ec2')

build() {
    cd en_core_web_sm-${pkgver}
    python setup.py build
}

package() {
    cd en_core_web_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
