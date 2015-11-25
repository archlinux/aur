# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-cached-property
pkgver=1.3.0
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/pydanny/cached-property"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('4a6039f7418007275505e355359396a8')
sha256sums=('458e78b1c7286ece887d92c9bee829da85717994c5e3ddd253a40467f488bc81')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
