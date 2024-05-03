# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-fi_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Finnish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/fi#section-fi_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/fi_core_news_lg-${pkgver}/fi_core_news_lg-${pkgver}.tar.gz")
b2sums=('a94e7465b25c06d90fa022ca09605ba3420942fbf1cdcf40744d8520c1a7352288858d85ba681add4acbb85e5738e12773db66bb845f6787fa9202a446e211a3')

build() {
  cd fi_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd fi_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
