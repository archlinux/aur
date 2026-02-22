# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-argdispatch
pkgver=1.5.0
pkgrel=1
pkgdesc="Drop-in replacement for python package argparse, dispatching subcommand calls to functions, modules or binaries."
depends=('python')
makedepends=('python-setuptools')
url="https://framagit.org/spalax/argdispatch"
license=('GPLv3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/argdispatch-v$pkgver.tar.gz")
md5sums=('e5f193b9d74014eed2290f130a30e158')

build() {
  cd "$srcdir/argdispatch-v$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/argdispatch-v$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
