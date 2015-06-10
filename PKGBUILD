# Contributor: Francois Boulogne fboulogne at april dot org
# Maintainer: Francois Boulogne fboulogne at april dot org
pkgname=lm
pkgver=0.4
pkgrel=3
pkgdesc="List Movies. Grab metadata fromIMDB and interact with opensubtitles"
arch=('i686' 'x86_64')
url="https://github.com/RedRise/lm"
license=('GPL3')
depends=('imdbpy' 'python2')
source=(https://github.com/downloads/RedRise/lm/${pkgname}-$pkgver.tar.gz)
md5sums=("8ade7a89af4385e525ca6d294461363e")

prepare() {
  cd "$srcdir/RedRise-lm-41c4004"

  sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/' lm.py
}

package() {
  cd "$srcdir/RedRise-lm-41c4004"
  install -d "${pkgdir}"/usr/bin/
  install -m 755 lm.py "${pkgdir}"/usr/bin/lm
}
# vim:ts=2:sw=2:et:
