# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ro_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Romanian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/ro#section-ro_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ro_core_news_lg-${pkgver}/ro_core_news_lg-${pkgver}.tar.gz")
b2sums=('fef6df4f3696268d2837df66a690c088ccb2c6cb29af25d6e09d1daae15fb70ebda2da255e38aa1a62f0c1f27588bfa79b364b5ecc4125a0b5328004828f500e')

build() {
  cd ro_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ro_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
