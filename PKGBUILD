# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-hostlist
pkgdesc="Python module for handling LLNL hostlists"
pkgver=2.0.0
pkgrel=1
arch=(x86_64)
url="https://www.nsc.liu.se/~kent/python-hostlist/"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://www.nsc.liu.se/~kent/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('998ead232fa12795eef051b6dae51e653cb05a53f27ac05406975a76cc077844169c9f815b6c972edd6ea8f801fe1f2a9494da303c4b0b79f8ef7c6d3ca629f8')

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
