# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Tim Hatch <tim@timhatch.com>

pkgname=python38-termcolor
pkgver=2.1.0
pkgrel=1
pkgdesc="ANSI Color formatting for output in terminal"
arch=('any')
license=('MIT')
url="https://github.com/termcolor/termcolor"
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-hatch-vcs')
checkdepends=('python38-pytest')
source=(https://pypi.python.org/packages/source/t/termcolor/termcolor-$pkgver.tar.gz)
sha256sums=('b80df54667ce4f48c03fe35df194f052dc27a541ebbf2544e4d6b47b5d6949c4')

build() {
  cd termcolor-$pkgver
  python3.8 -m build --no-isolation --wheel
}

check() {
  cd termcolor-$pkgver
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd termcolor-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
