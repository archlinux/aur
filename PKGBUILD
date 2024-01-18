# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-argdispatch
pkgver=1.3.1
pkgrel=2
pkgdesc="Drop-in replacement for python package argparse, dispatching subcommand calls to functions, modules or binaries."
depends=('python-setuptools')
url="https://framagit.org/spalax/argdispatch"
license=('GPLv3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/argdispatch-v$pkgver.tar.gz")
md5sums=('504665cc4c3f8496a2fac41b787d9f03')

build() {
  cd "$srcdir/argdispatch-v$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/argdispatch-v$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
