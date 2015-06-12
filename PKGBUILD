# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=red-alien-git
pkgver=r103.dceefbd
pkgrel=1
pkgdesc="A script compiler and editor for Pokémon GBA ROMs"
arch=(any)
url="https://github.com/cosarara97/red-alien"
license=('GPL')
depends=('python' 'python-qscintilla-qt5' 'python-pyqt5')
makedepends=('git')
options=(!emptydirs)
source=('red-alien-git::git+https://github.com/cosarara97/red-alien.git')
md5sums=(SKIP)

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
