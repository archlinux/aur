# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-da_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Danish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-da_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/da_core_news_lg-${pkgver}/da_core_news_lg-${pkgver}.tar.gz")
b2sums=('25d863569de5bd995bb472c46132eb8c0b2f64b3bb7dc38d546b02417e37d9c9c7e5a05269a3fdf7b48ddc00366fc0735b57cf78afc18ee9919b29b65060bf2d')

build() {
  cd da_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd da_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
