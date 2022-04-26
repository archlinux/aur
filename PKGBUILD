# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-lru-dict
pkgver=1.1.7
pkgrel=2
pkgdesc='A fast and memory efficient LRU cache for Python'
arch=(x86_64)
url=https://github.com/amitdev/lru-dict
license=(MIT)
depends=(python)
makedepends=(
  git
  python-setuptools
)
_commit=64bc69b27dd2b5bcd68c93cce41c8513eb63151e
source=(git+https://github.com/amitdev/lru-dict.git#commit=${_commit})
b2sums=(SKIP)

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
