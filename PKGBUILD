# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=3.0.0
pkgrel=1
pkgdesc="Dutch pretrained model for spaCy (small)"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('0378bcb08bc123c87fdc90c094824fafceb494a7a413aff52ccc97a0df9895d0')

build(){
	cd nl_core_news_sm-${pkgver}
	python setup.py build
}

package(){
	cd nl_core_news_sm-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
