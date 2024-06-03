# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=bk7231tools
pkgver=2.0.2
pkgrel=1
pkgdesc='A collection of tools to interact with and analyze artifacts for BK7231 MCUs'
url='https://github.com/tuya-cloudcutter/bk7231tools'
arch=('any')
license=('MIT')
depends=(
  python
  python-pyserial
  python-pycryptodome
  python-datastruct
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=(https://github.com/tuya-cloudcutter/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('abc2e1b1ef1927ca5e3081dfbead5fba42ead7a5dd55d435777f2d087217e3c4')
b2sums=('a1921b9901100aca3cec3db64544576650b570b3c2d9c74dffc524d9f0ca8b89b32e4715c050228d63be62135449d25019f706a1b8a7e2a818f0d1bee82e9eb1')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
