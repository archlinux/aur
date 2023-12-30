# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-it_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Italian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-it_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/it_core_news_lg-${pkgver}/it_core_news_lg-${pkgver}.tar.gz")
b2sums=('4e34d4a674eec1216877d5992a1337c0428156cc9bac422e0b8f1cd31ebfee71d559d992bbcb07085a695fa745f8e92dca0012c3068e8de4d18d00b9914d3363')

build() {
  cd it_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd it_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
