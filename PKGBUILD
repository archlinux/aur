# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-da_core_news_trf
pkgver=3.8.0
pkgrel=1
pkgdesc='Danish pretrained model for spaCy (transformer)'
arch=(any)
url='https://spacy.io/models/da#section-da_core_news_trf'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/da_core_news_trf-${pkgver}/da_core_news_trf-${pkgver}.tar.gz")
b2sums=('910762382e65f1dd95c04777fe2a0b331bc70b9ba31bfe7721437b6e7bc47e0801655a56ffb5406280f1a4a344342ef13682603eb9def716fafb35eb0be6ba00')

build() {
  cd da_core_news_trf-${pkgver}
  python setup.py build
}

package() {
  cd da_core_news_trf-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
