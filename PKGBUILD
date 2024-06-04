# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=shedskin
pkgver=0.9.8
pkgrel=2
pkgdesc='Python to C++ compiler'
arch=('any')
url='https://shedskin.github.io/'
license=('GPL-3.0-only')
depends=('pcre' 'gc' 'python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/shedskin/shedskin.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  sed -i 's:bin/python:usr/bin/python:' "$pkgname/scripts/$pkgname"
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir"/
}

# vim: ts=2 sw=2 et:
