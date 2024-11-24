# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-fi_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Finnish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/fi#section-fi_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/fi_core_news_lg-${pkgver}/fi_core_news_lg-${pkgver}.tar.gz")
b2sums=('fd0431fb8597203fb4fb270927df52ccea8efb0511257461afcf4b00a09cad5712fce96f9f24a950ab796b5ce6849672b853df92fea6c69a32b6795922e6de21')

build() {
  cd fi_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd fi_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
