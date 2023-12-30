# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-da_core_news_trf
pkgver=3.7.2
pkgrel=1
pkgdesc='Danish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-da_core_news_trf'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/da_core_news_trf-${pkgver}/da_core_news_trf-${pkgver}.tar.gz")
b2sums=('c234b91d77a4412c96c1b4fca5dee323e88895f86dbf64212aa96159b0eefcaa3851a834a9288cf4111f6fb0ec01c41225101443727c7f9ed06d3e3d33100032')

build() {
  cd da_core_news_trf-${pkgver}
  python setup.py build
}

package() {
  cd da_core_news_trf-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
