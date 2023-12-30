# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-fr_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='French pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-fr_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/fr_core_news_lg-${pkgver}/fr_core_news_lg-${pkgver}.tar.gz")
b2sums=('beb54e2abee76265835079c63db983130374c2c6f8e9301213c31ab6e21f30d0da02589e3e8faed7b26215687623b68666bc8925f2588a2ed3f63cff895a6236')

build() {
  cd fr_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd fr_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
