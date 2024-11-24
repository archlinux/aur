# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-pt_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Portuguese pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-pt_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/pt_core_news_lg-${pkgver}/pt_core_news_lg-${pkgver}.tar.gz")
b2sums=('a3bc7dc144c4a788c164803a8c3472c090f29c80e9ca69fdb2a49cf038a29d9851c4b5b0523c8a6896ecad3b6b0e5fe99557e7b1b4b533158bf3970b8a2d7819')

build() {
  cd pt_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd pt_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
