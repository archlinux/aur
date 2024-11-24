# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ru_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Russian pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-ru_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ru_core_news_lg-${pkgver}/ru_core_news_lg-${pkgver}.tar.gz")
b2sums=('d9496e26a2b19e1ae7c1ffa7a460cfe61425d2343aaad7b9bc34b5e35b7c7bceba5abcb110df7d2ce4ee06dcbce116af54dbc0de019e8b0ddcdaa152bf8ac959')

build() {
  cd ru_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ru_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
