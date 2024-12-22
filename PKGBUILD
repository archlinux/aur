# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-hostlist
pkgdesc="Python module for handling LLNL hostlists"
pkgver=2.2.1
pkgrel=2
arch=(x86_64)
url="https://www.nsc.liu.se/~kent/python-hostlist/"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://www.nsc.liu.se/~kent/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('7c734c00d2dfa8d5ef83c2fbdfa5d6c21c8e00f87a3d12799c6a2da8a2027ba237375f0f5484e7d5ee989bd4aace044c886f4213a70805e98327e6fa46bc6f75')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
