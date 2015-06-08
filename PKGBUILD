# Maintainer: Stefan Betz <info@stefan-betz.net>
# Contributor: Daniele Paolella <dp@hostess-promoter.com>
pkgname=trac-mercurial
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Mercurial plugin for Trac"
arch=('any')
url="http://trac.edgewall.org/wiki/TracMercurial"
license=('GPL2')
depends=('setuptools' 'trac>=1.0')
makedepends=('mercurial')

build() {
  cd "$srcdir"
  hg clone http://hg.edgewall.org/trac/mercurial-plugin#1.0
  cd mercurial-plugin
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  mkdir -p "$pkgdir/usr/share/doc/trac-mercurial"
  install README "$pkgdir/usr/share/doc/trac-mercurial"
}
