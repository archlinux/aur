# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-zh_core_web_lg
pkgver=3.8.0
pkgrel=1
pkgdesc='Chinese pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-zh_core_web_lg'
license=(CCPL)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/zh_core_web_lg-${pkgver}/zh_core_web_lg-${pkgver}.tar.gz")
b2sums=('3fd0dc4e276f5a865834576f6c280fe52bf069b515e2f9a558a6cdba5fe5fea1b64484562614390af79bdea3c3b6372cc29f4614a73610bce4b3498ba5283573')

build() {
  cd zh_core_web_lg-${pkgver}
  python setup.py build
}

package() {
  cd zh_core_web_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
