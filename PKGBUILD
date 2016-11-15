# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=barectf
pkgver=2.2.1
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
md5sums=('aaded50522939a700f62024fba92bd6a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "doc/man/barectf.1" "$pkgdir/usr/share/man/man1/barectf.1"
  install -Dm644 "extra/barectf-tracepoint.h" "$pkgdir/usr/include/barectf-tracepoint.h"
}
