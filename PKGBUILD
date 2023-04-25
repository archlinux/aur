# Contributor: Louis Rannou <louson at gresille dot org>

python=python
name=musicbrainzez

pkgname=$python-$name
pkgver=1.0
pkgrel=2
pkgdesc="Python bindings for the MusicBrainz web service (WS/2)"
url="https://gitlab.com/Louson/python-musicbrainzez"
license=('BSD2')
arch=('any')
depends=('python' 'python-authlib' 'python-requests')
source=("https://gitlab.com/Louson/python-musicbrainzez/-/archive/v1.0/python-musicbrainzez-v${pkgver}.tar.bz2")
md5sums=('be3831cd1e7af574d32d98e7a81aca23')

prepare() {
  cd $srcdir/$pkgname-v$pkgver
}

build() {
  cd $srcdir/$pkgname-v$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$pkgname-v$pkgver
  $python setup.py install --skip-build --root=$pkgdir
}
