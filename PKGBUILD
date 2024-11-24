# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-ko_core_news_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Korean pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-ko_core_news_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/ko_core_news_lg-${pkgver}/ko_core_news_lg-${pkgver}.tar.gz")
b2sums=('880350fd2d9f9a4f5cba82b42b999ab2fcb9c1af9059f16d67e166f62f96b17199752abb5cd83f32d790a4998476af8052f955083221ffd0c54f9ef494531409')

build() {
  cd ko_core_news_lg-${pkgver}
  python setup.py build
}

package() {
  cd ko_core_news_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
