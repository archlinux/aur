# Maintainer: Ash Price <eisleggje@gmail.com>
pkgname=python-spacy-zh_core_web_lg
pkgver=3.7.0
pkgrel=1
pkgdesc='Chinese pretrained model for spaCy (large)'
arch=(any)
url='https://spacy.io/models/da#section-zh_core_web_lg'
license=(CCPL)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/zh_core_web_lg-${pkgver}/zh_core_web_lg-${pkgver}.tar.gz")
b2sums=('8dbcaa0649f86a005193f994991a9e863b7a9be1124e968051cf3adf6b876d5bbd26d9679ee2ad6eef4021805e442e3dc6049bf0e61b956da173cba706146901')

build() {
  cd zh_core_web_lg-${pkgver}
  python setup.py build
}

package() {
  cd zh_core_web_lg-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
