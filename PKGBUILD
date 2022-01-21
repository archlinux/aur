# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_md
pkgver=3.2.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (medium)'
arch=(any)
url='https://spacy.io/models/nl#section-nl_core_news_md'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_md-${pkgver}/nl_core_news_md-${pkgver}.tar.gz")
b2sums=('39887a5d29a49f69e58265ec4a10a1cdbf4ebc023f4e753667215469a6cd11c2ddcadf3c60fadf5dc15a7ce977f37a0dd364e6c6116ce6d3c1ddd8b9e1dc87ed')

build() {
	cd nl_core_news_md-${pkgver}
	python setup.py build
}

package() {
	cd nl_core_news_md-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
