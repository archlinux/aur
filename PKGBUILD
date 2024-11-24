# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-uk_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Ukrainian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-uk_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/uk_core_news_lg-${pkgver}/uk_core_news_lg-${pkgver}.tar.gz")
b2sums=('d3336f1ad74cdc0faa69ac93e6b9c91a154d3b643a085ac7c336ce7860d2bbc7d2613ee40325978864c3c3971c73b92fae87801c561ea127ce8040738897894c')

build() {
  cd uk_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd uk_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
