# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-pt_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Portuguese pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-pt_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/pt_core_news_lg-${pkgver}/pt_core_news_lg-${pkgver}.tar.gz")
b2sums=('beb0e6a4c2530e5c60fa85a9db4cfbc7ce136af90f4b36b183d2f220b8feda1bcda950da0a20f9322df4b70a76620d31b435cfd11cd91137f61da6ff5977006f')

build() {
  cd pt_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd pt_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
