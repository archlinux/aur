# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mecab
_pkgname=mecab-python
pkgver=0.996
pkgrel=1
pkgdesc="Morphological Analysis Tool - Python3 interface"
arch=('x86_64' 'i686')
url="https://code.google.com/p/mecab/"
license=('BSD' 'LGPL2.1' 'GPL2')
depends=("python" "mecab")
makedepends=("gcc")
source=("${_pkgname}-${pkgver}.tar.gz::https://doc-0k-74-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/ls054mqvh0mq5esas8u09urors7f0aut/1433858400000/13553212398903315502/*/0B4y35FiV1wh7UlJpaWJKM01KRVE?e=download"
        "setup.patch")
sha1sums=('b7801d78b4def5118903f3d7b97968b106aa8ea8'
          'd9a39080d9f742821ac1da41c510ca8db53b0201')

build() {
  cd $srcdir/${_pkgname}-${pkgver}

  patch < ${srcdir}/setup.patch
  python setup.py build_ext
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python setup.py install --root=$pkgdir
  install -Dm644 COPYING \
            ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
