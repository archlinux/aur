# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-uk_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Ukrainian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-uk_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/uk_core_news_lg-${pkgver}/uk_core_news_lg-${pkgver}.tar.gz")
b2sums=('b60f04106bf837c0878eaaad6f36a4f8b82ec0cebaf803be9088e8d5725d5d0a18273239903a4c81cc7e0e4b212acc1749e17a183acadf99a29c0fb562d0c393')

build() {
  cd uk_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd uk_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
