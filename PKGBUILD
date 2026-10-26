# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.12
pkgrel=1
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL-3.0-or-later)
arch=('x86_64' 'aarch64')
depends=(python)
makedepends=(python-build python-maturin python-installer)
source=("${url}/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
b2sums=('8074647c2e6ebb9181bc06f273421bbbaf2fdb082a7e7f2521ea578c661d5387e658c242786b39872e20cbb231c4987e7046072bf870551c57894b98af302505')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
