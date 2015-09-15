# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=f-engrave
pkgver=1.51
pkgrel=2
pkgdesc=""
url="https://github.com/Ultimaker/libArcus"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('dos2unix')
depends=('python' 'ttf2cxf')
source=(http://www.scorchworks.com/Fengrave/F-Engrave-${pkgver}_src.zip arch.patch)
md5sums=('e17d5345f703b05618b9c1eae6b81ce2'
         'd0f798648d842560300f8350e8da3f26')

prepare() {
  cd F-Engrave-${pkgver}_src
  patch < ../arch.patch
}

package() {
  cd F-Engrave-${pkgver}_src
  install -Dm755 f-engrave-151.py "$pkgdir/usr/bin/f-engrave"
  dos2unix "$pkgdir/usr/bin/f-engrave"
}

# vim:set ts=2 sw=2 et:
