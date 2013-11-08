# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

python=python
name=musicbrainzngs

pkgname=$python-$name
pkgver=0.4
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
url="http://python-musicbrainzngs.readthedocs.org/"
license="BSD"
arch=('any')
depends=('python')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz
remove_unused_data.patch)
md5sums=('ec4323fa1ad4938f9376496bc8c27b05'
         '95dd1b00b5946775299cc787d328b152')

prepare() {
  cd $srcdir/$name-$pkgver
  patch -p1 < ../remove_unused_data.patch
}

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --root=$pkgdir
}
