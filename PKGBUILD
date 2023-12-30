# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-nb_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Norwegian (bokmål) pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-nb_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/nb_core_news_lg-${pkgver}/nb_core_news_lg-${pkgver}.tar.gz")
b2sums=('f72f88e27549299faa7305f05b1bf1eb4ba3bb20ed8ec37fdbb52b017e3a639c5805ca77d2e4f23e0fca5bc7d09f34a1e5d85e6c7dbfac0b97e5fc1423dddc49')

build() {
  cd nb_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd nb_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
