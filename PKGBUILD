# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=barectf
pkgver=2.2.0
pkgrel=1
pkgdesc="Generator of C99 code that can write native CTF out of a YAML configuration file"
arch=('any')
url='http://barectf.org'
license=('MIT')
depends=('python' 'python-setuptools' 'python-termcolor' 'python-yaml')
makedepends=('python-setuptools')
provides=('barectf')
conflicts=('barectf')
source=("https://github.com/efficios/barectf/archive/v$pkgver.tar.gz")
md5sums=('24deb3ccfb457b370d8dd96d5f7fc422')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "doc/man/barectf.1" "$pkgdir/usr/share/man/man1/barectf.1"
  install -Dm644 "extra/barectf-tracepoint.h" "$pkgdir/usr/include/barectf-tracepoint.h"
}
