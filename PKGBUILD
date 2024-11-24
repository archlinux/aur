# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ro_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Romanian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/ro#section-ro_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ro_core_news_lg-${pkgver}/ro_core_news_lg-${pkgver}.tar.gz")
b2sums=('d858d2e03c2a763d3f44a9b1698a38c8f09808181ebe882d82c1b2075d4e8a591f9635b0810115009b841d37a3c889eef549f0c6468391c3e3ac3d8f30957907')

build() {
  cd ro_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ro_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
