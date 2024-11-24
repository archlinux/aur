# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-pl_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Polish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/pl#section-pl_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/pl_core_news_lg-${pkgver}/pl_core_news_lg-${pkgver}.tar.gz")
b2sums=('db4a5685b2a1b17f39346cbd4dc2febdd5e2e93bd1b60643f24f48a2de82d39f165a0534090648caffceb08510304ce166aa6345b9b74d3ed592584cedeb0663')

build() {
  cd pl_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd pl_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
