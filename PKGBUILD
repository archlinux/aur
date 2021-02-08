# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=3.0.0
pkgrel=1
pkgdesc="Multi-lingual pretrained model for spaCy (small)"
url="https://spacy.io/models/xx#section-xx_ent_wiki_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('ba312602d8b7a0db141421d8c4819f85d7d06843ac2e84f9dc561b46aeda2584')

build() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py build
}

package() {
	cd xx_ent_wiki_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
