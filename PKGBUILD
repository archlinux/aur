# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Joshua Leahy <jleahy@gmail.com>

pkgname=python-freetype-py
_pkgname=freetype-py
pkgver=2.1.0
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
depends=('python' 'freetype2')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha1sums=('3849229fe378526542edc52dff5b55bdb240fc38')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et ft=sh:
