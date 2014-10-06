# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
pkgver=0.4.2
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
groups=()
depends=('python2')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/f/freetype-py/freetype-py-${pkgver}.tar.gz")
sha1sums=('8f56772c7df374de126d0269f933f6b5650d06b3')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm "$pkgdir/usr/Vera.ttf"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
