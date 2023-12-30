# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ru_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Russian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-ru_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ru_core_news_lg-${pkgver}/ru_core_news_lg-${pkgver}.tar.gz")
b2sums=('605069809ec98d44086c90ddae8189cea6541e24d9be9ee406fdcce7821b731d4d5c7ee21cca9898e6c0aab7164bfc9f3fd80153c7420e53f9c2e0c28acda971')

build() {
  cd ru_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ru_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
