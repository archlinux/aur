# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=shedskin
pkgver=0.9.4
pkgrel=3
pkgdesc='Python to C++ compiler'
arch=('any')
url='https://shedskin.github.io/'
license=('GPL2')
depends=('pcre' 'gc' 'python2')
makedepends=('git')
source=("git+https://github.com/shedskin/shedskin.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  sed -i 's:bin/python:usr/bin/python:' "$pkgname/scripts/$pkgname"
}

package() {
  cd "$pkgname"

  python2 setup.py install --prefix="$pkgdir/usr"
}

# vim: ts=2 sw=2 et:
