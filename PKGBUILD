# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>

pkgname=adns-python
pkgver=1.2.1
pkgrel=6
pkgdesc="Python bindings for adns"
arch=('x86_64')
url="https://pypi.python.org/pypi/adns-python"
depends=('adns' 'python2')
makedepends=()
license=('GPL2')
source=($pkgname-$pkgver::https://github.com/daniilr/adns-python/archive/$pkgver.tar.gz)
md5sums=('b01a97f1bf8d54012e71f2b34be802bf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  # python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' DNSBL.py
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' ADNS.py
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
