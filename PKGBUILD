# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-nose-timer
pkgver=1.0.0
pkgrel=1
pkgdesc='Timer plugin for nosetests'
arch=(any)
url='https://github.com/mahmoudimus/nose-timer'
license=(MIT)
depends=(python-nose)
makedepends=(git python-setuptools)
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/nose-timer
  python setup.py build
}

package() {
  cd ${srcdir}/nose-timer
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
