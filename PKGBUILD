# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-da_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Danish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-da_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/da_core_news_lg-${pkgver}/da_core_news_lg-${pkgver}.tar.gz")
b2sums=('2c4bdc3521a5c250662635f475c5ef296b7ca2f3fa02d5d8e9e0f7bf3d091af8c885d324cedc7c52244c0001cac48743e82ee755f15852cc3a4f3fc48dcf4cfc')

build() {
  cd da_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd da_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
