# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-sl_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Slovenian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-sl_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/sl_core_news_lg-${pkgver}/sl_core_news_lg-${pkgver}.tar.gz")
b2sums=('1879f13b5a281a899e0ec69f9d17aa1eb0aa651a413a6c5f558159f4a5b4eec9d2b6bf7b3a933c5a65313549f2990386e35f501403eeeaa8212acba253a88ef9')

build() {
  cd sl_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd sl_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
