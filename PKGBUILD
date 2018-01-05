# $Id: PKGBUILD 66136 2012-02-23 01:43:46Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python2-vorbissimple
pkgver=0.0.2
pkgrel=7
pkgdesc="Python bindings for vorbissimple"
arch=('x86_64')
url="http://kamaelia.sourceforge.net"
license=('MPL')
depends=('python2' 'vorbissimple')
makedepends=('pyrex')
source=(https://downloads.sourceforge.net/kamaelia/vorbissimple-$pkgver.tar.gz)
sha256sums=('0e02a723549b8f2c5d720d9cc830c039b9fc842e8845e6c2cecec96fa1bdceb0')

package() {
  cd "$srcdir"/vorbissimple-$pkgver/python
  sed -i 's#__new__#__cinit__#' vorbissimple.pyx
  python2 setup.py install --root="$pkgdir"
}
