# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-lru-dict
pkgver=1.3.0
pkgrel=1
pkgdesc='A fast and memory efficient LRU cache for Python'
arch=(x86_64)
url=https://github.com/amitdev/lru-dict
license=(MIT)
depends=(python)
makedepends=(
  git
  python-setuptools
)
_tag=51c2761d94fd6fc85faea550240814938d1594f9
source=(git+https://github.com/amitdev/lru-dict.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd lru-dict
  git describe --tags | sed 's/^v//'
}

build() {
  cd lru-dict
  python setup.py build_ext
}

package() {
  cd lru-dict
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-lru-dict/
}

# vim: ts=2 sw=2 et:
