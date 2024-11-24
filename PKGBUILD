# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-fr_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-fr_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_lg-${pkgver}/fr_core_news_lg-${pkgver}.tar.gz")
b2sums=('648c5b25402dfa8ee8acde2067cbf6d0803a6632e6fc7dc8522eca548ac2a75a1bf879745235a9b3a2223aa3e98ac8b89a6ebb6f6612e3a3acdc4edb8271faff')

build() {
  cd fr_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd fr_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
