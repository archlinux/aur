# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-simplematch
_name=simplematch
pkgver=1.4
pkgrel=1
pkgdesc="Minimal, super readable string pattern matching for Python."
arch=('any')
url="https://github.com/tfeldmann/simplematch"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha1sums=('2beed5a1007f143ae18f8df4e769d34bdabdf6d0')
sha256sums=('55a77278b3d0686cb38e3ffe5a326a5f59c2995f1ba1fa1a4f68872c17caf4cb')


build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
