# Maintainer: Reihar <reihar@necronomicon.fr>
pkgname=python-gol
pkgver=1.0.2.r3.g288bc87
pkgrel=1
pkgdesc="A python implementation of Conway's Game of Life using the curses module with a small evolutionary twist."
arch=('i686' 'x86_64')
url="https://github.com/iiSeymour/game-of-life"
license=('MIT')
depends=('python')
makedepends=('git')
conflicts=('python2-gol')
replaces=('python2-gol')
options=(!emptydirs)
install=python-gol.install
source=($pkgname::git+https://github.com/iiSeymour/game-of-life.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
