# Maintainer: Buce <dmbuce@gmail.com>

pkgname=python-pynbt-git
pkgver=1.3.0.r34.gb8c6494
pkgver() {
	cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="Tiny, liberally-licensed NBT library"
url="http://github.com/TkTech/PyNBT"
depends=('python')
makedepends=('python-distribute' 'git')
license=('MIT')
arch=('any')
source=("$pkgname::git+https://github.com/TkTech/PyNBT.git")
md5sums=(SKIP)
provides=(python-pynbt)
conflicts=(python-pynbt)
replaces=()

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
