# Maintainer: Stefan Betz <info@stefan-betz.net>
# Contributor: Daniele Paolella <dp@hostess-promoter.com>
pkgname=trac-mercurial
_name=TracMercurial
pkgver=1.0.0.9
pkgrel=1
pkgdesc="Mercurial plugin for Trac"
arch=('any')
url="http://trac.edgewall.org/wiki/TracMercurial"
license=('GPL2')
depends=('python2-setuptools' 'trac>=1.0' 'mercurial')
source=("https://pypi.io/packages/source/T/$_name/$_name-$pkgver.tar.gz")
md5sums=('51f151c7d10ae2b7a1e3b67a4b427e5b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm0644 README "$pkgdir/usr/share/doc/trac-mercurial"
}
