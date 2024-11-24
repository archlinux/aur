# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-nl_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Dutch pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/nl#section-nl_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_lg-${pkgver}/nl_core_news_lg-${pkgver}.tar.gz")
b2sums=('86215d7d177e8feb7566d76e265390c519023f72aa64c399795acd82c65adfe8f0becaabc18439ef3251ba6fadb6fcc2b62d04cd75967ff7943d2b339c4ec48f')

build() {
	cd nl_core_news_lg-${pkgver}
	python setup.py build
}

package() {
	cd nl_core_news_lg-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
