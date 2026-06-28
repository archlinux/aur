# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.6.10
pkgrel=1
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=(LGPL-3.0-or-later)
arch=('x86_64' 'aarch64')
depends=(python)
makedepends=(python-build python-maturin python-installer)
source=("${url}/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
b2sums=('bbc88178f9241ac3453002c89259d387e8631a56333a1d75c3954334f2edb2da12b8baa646b688ed0c283d4db5989c85a0d34226445b8fdbb426989a592d3e59')

build() {
  cd python-bidi-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd python-bidi-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
