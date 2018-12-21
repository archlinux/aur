# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-nose-timer
pkgver=0.7.4
pkgrel=1
pkgdesc='Timer plugin for nosetests'
arch=(any)
url='https://github.com/mahmoudimus/nose-timer'
license=(MIT)
depends=(python-nose)
makedepends=(git python-setuptools)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd nose-timer

  python setup.py build
}

package() {
  cd nose-timer

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
