# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>

_base=sauce
pkgname=python2-${_base}
pkgver=1.2
pkgrel=1
pkgdesc="SAUCE record parser"
arch=(any)
url="https://github.com/tehmaze/${_base}"
license=(MIT)
depends=(python2)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('098fc621f11653edcf5c548ec60bf9999f2f5d83d9d7223d3964cf83512066bc306a2ef12b85b20918009b61cc63503ddd82d406b8afb8a5ee07a1db54169eea')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
