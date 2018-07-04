# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
_name=freetype-py
pkgver=2.0.0.post6
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/freetype-py/freetype-py-${pkgver}.tar.gz")
sha1sums=('a97bef7816cb155beb63c7fad4f1ddd137f72f89')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
