# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-el_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Greek pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/el#section-el_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/el_core_news_lg-${pkgver}/el_core_news_lg-${pkgver}.tar.gz")
b2sums=('85492faa9e628b44083ab5195eb32edd9600b9c83205d0e6c8ecc0ba982d6cac5f3b9d1c57c6f2213048ee55be83d17847713d839844836956d4f73ccdf4e018')

build() {
  cd el_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd el_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
