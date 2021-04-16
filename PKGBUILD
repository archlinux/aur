# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kwpolska <kwpolska@kwpolska.tk>

pkgname=python2-unidecode
pkgver=1.2.0
pkgrel=1
pkgdesc='ASCII transliterations of Unicode text'
arch=('any')
url=https://github.com/avian2/unidecode
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("${url}/archive/refs/tags/unidecode-${pkgver}.zip")
sha256sums=('aef39ed7054376e416e7b81baf4816eaa8c0abc5724c45e3d3575a6f54a42831')

build() {
  cd unidecode-unidecode-${pkgver}
  python2 setup.py build
}

package() {
  cd unidecode-unidecode-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  cp "$pkgdir"/usr/bin/unidecode "$pkgdir"/usr/bin/python2-unidecode
  rm "$pkgdir"/usr/bin/unidecode

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
