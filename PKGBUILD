# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=python-py-radix
pkgver=1.1.0
pkgrel=1
pkgdesc='Implements the radix tree data structure'
arch=('aarch64' 'x86_64')
url='https://github.com/mjschultz/py-radix'
license=('BSD-4-Clause' 'ISC')
makedepends=('python-setuptools')
depends=('glibc' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('969a3bb057d298c9b4dd537d70ce15143089fc20cd896c9f91b044691985b143')

package() {
  cd "$srcdir/py-radix-$pkgver"
  python setup.py install -O2 --root="$pkgdir"
  install -Dm0644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 LICENSE    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# eof
