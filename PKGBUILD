# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=3.1.0
pkgrel=1
pkgdesc='Multi-lingual pretrained model for spaCy (small)'
url='https://spacy.io/models/xx#section-xx_ent_wiki_sm'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(CCPL)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('f2a10032fdda059c9a3442e247268def539f9f3db1cd6417dad10bb2eda16a0e')

build() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py build
}

package() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
