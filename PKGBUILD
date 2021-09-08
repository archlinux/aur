# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=3.1.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (small)'
url='https://spacy.io/models/nl#section-nl_core_news_sm'
depends=(python-spacy)
makedepends=(python-setuptools)
license=(CCPL)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('fb215dc656ca9fbbc0864b4fa3cb58b28e3593f9234cb7c558aed07468d30893')

build(){
	cd nl_core_news_sm-${pkgver}
	python setup.py build
}

package(){
	cd nl_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
