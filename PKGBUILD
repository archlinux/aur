# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ja_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Japanese pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-ja_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ja_core_news_lg-${pkgver}/ja_core_news_lg-${pkgver}.tar.gz")
b2sums=('9096d5e74317392aa4002d492b0dd696f8e869503a99915da1b19740d11c78d0bac915cdb58fbba7b890d88c92b4d1649ec082b237f3456ab3e8b83eb279f87c')

build() {
  cd ja_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ja_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
