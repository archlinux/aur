# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=fvs
pkgver=0.3.1
pkgrel=1
pkgdesc="File Versioning System with hash comparison, deduplication and data storage to create unlinked states that can be deleted"
arch=(any)
url="https://github.com/mirkobrombin/FVS"
license=(MIT)
depends=(python-orjson)
makedepends=(python-setuptools)
conflicts=(python-vfs)
replaces=(python-vfs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirkobrombin/FVS/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0ff5add2294110dbe5be6070279d658a3650beff8f2c66567bf38d3b4273b3db')

build() {
  cd "FVS-${pkgver}"
  python setup.py build
}

package() {
  cd "FVS-${pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}