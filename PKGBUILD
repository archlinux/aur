# Maintainer: greyltc
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-pox
pkgver=0.3.3
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url="https://github.com/uqfoundation/pox"
arch=(any)
license=('BSD')
depends=('python>=3.7')
makedepends=('python-setuptools>=42.0' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uqfoundation/pox/archive/refs/tags/pox-${pkgver}.tar.gz")
sha256sums=('a9ac22c771ee455bfee5262ebff50cbb8d582e478df4182cd0464329a6f94e40')

build() {
  cd "pox-pox-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pox-pox-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
