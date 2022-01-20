# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=3.2.0
pkgrel=1
pkgdesc='Multi-lingual pretrained model for spaCy (small)'
arch=(any)
url='https://spacy.io/models/xx#section-xx_ent_wiki_sm'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
b2sums=('5a24927c2d5c45990de78c88ab75fcb73f7d380445a33ee32283c4cf81303b61e4810e960b2dced5601eeffa9d5eb593ba02f14ee0ac9e0d26081c53a082a782')

build() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py build
}

package() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
