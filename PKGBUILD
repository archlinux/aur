# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-it_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Italian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-it_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/it_core_news_lg-${pkgver}/it_core_news_lg-${pkgver}.tar.gz")
b2sums=('a559f8fa8b357092dd12f81cd758c949028e8aa38938d35e40e66b689591e99ed5668ac2075cac891a4492e835dce800149e3556878a9cd8a7377f407313aa52')

build() {
  cd it_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd it_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
