# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=barectf
pkgver=2.3.1
pkgrel=1
pkgdesc='Generator of ANSI C tracers which output CTF'
arch=('any')
url='http://barectf.org'
license=('MIT')
depends=('python' 'python-setuptools' 'python-termcolor' 'python-yaml')
makedepends=('python-setuptools')
provides=('barectf')
conflicts=('barectf')
source=("https://github.com/efficios/barectf/archive/v$pkgver.tar.gz")
md5sums=('9ea5bc81724b8bdd0f20bca3d2a9d8c0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "doc/man/barectf.1" "$pkgdir/usr/share/man/man1/barectf.1"
  install -Dm644 "extra/barectf-tracepoint.h" "$pkgdir/usr/include/barectf-tracepoint.h"
}
