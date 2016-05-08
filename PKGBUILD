# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

python=python
name=musicbrainzngs

pkgname=$python-$name
pkgver=0.6
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS web service (WS/2)"
url="http://python-musicbrainzngs.readthedocs.org/"
license=('BSD')
arch=('any')
depends=('python')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)
md5sums=('22616f1710f13a8da933920089c51441')

prepare() {
  cd $srcdir/$name-$pkgver
}

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --skip-build --root=$pkgdir
}
