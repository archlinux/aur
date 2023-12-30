# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ko_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Korean pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-ko_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ko_core_news_lg-${pkgver}/ko_core_news_lg-${pkgver}.tar.gz")
b2sums=('ffbf8bbb8a4ed5188f47e66cb0d4bdc002715aeab70a6fb4930229212e4eaa874ae87427d3ed78235139d6da700471b6d01f8a426c3607d9ef5fe82e5264e105')

build() {
  cd ko_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ko_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
