# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-pl_core_news_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Polish pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/pl#section-pl_core_news_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/pl_core_news_lg-${pkgver}/pl_core_news_lg-${pkgver}.tar.gz")
b2sums=('a6c369077a36080f6f41686583aa7394739a72569b8a046ca293b4e34f71fb3ec09f146dc45e3b52bddfd7b60454609714572a4ce687886c2cb45daa21fe5cb9')

build() {
  cd pl_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd pl_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
