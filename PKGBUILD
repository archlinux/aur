# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python2-graphy
pkgver=1.0
pkgrel=3
pkgdesc='Simple Chart Library for Python (deprecated Google Chart API)'
arch=('any')
url='https://code.google.com/p/graphy/'
license=(Apache)
depends=('python2')
makedepends=('python2-distribute')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/graphy/graphy_${pkgver}.tar.bz2"
        setup.py)
b2sums=('c14e969c7eb3713c9eece2a7b05f018e5a72cbd20b1ab1bb49897c7d569bd9a63b3b73530983d4015a92cbdd0c76cab9fd4aeeb1b0f7525eb2226732947a1452'
        '9d35174cea93b71ae4447ad67507a23c6b9636722c711da2a30d8a222452c540ed30dea443bf15d278ed71d0fde8da47b80a7f9a4472349bdde3190b5f44f395')

build () {
  cd graphy_${pkgver}
  cp ../setup.py .
  python2 setup.py build
}

package() {
  cd graphy_${pkgver}
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
