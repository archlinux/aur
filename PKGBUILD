# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-sv_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Swedish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-sv_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/sv_core_news_lg-${pkgver}/sv_core_news_lg-${pkgver}.tar.gz")
b2sums=('39c7a9c9d2cfd65a7e911d770e1ddf7ac413e3c38198315b73b1ad929df227267957c7e8be39a14f6e15163eab83648ca168df74f1495770b5dcd61e8310ad39')

build() {
  cd sv_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd sv_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
