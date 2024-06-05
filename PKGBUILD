# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John Reese <john@noswap.com>
# Upstream URL: https://github.com/jreese/dotlink
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=dotlink
pkgver=2.1
pkgrel=2
pkgdesc="Automated deployment of dotfiles to local or remote locations"
arch=('any')
url="https://github.com/jreese/dotlink"
license=('MIT')
depends=('python' 'python-click' 'python-platformdirs' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-installer')

source=("https://pypi.python.org/packages/source/D/Dotlink/dotlink-${pkgver}.tar.gz")
md5sums=('32d0636b460fc43dd73e2653822f34d4')

build() {
  cd "$srcdir/dotlink-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/dotlink-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
