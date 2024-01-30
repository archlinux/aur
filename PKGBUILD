# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=bk7231tools
pkgver=1.5.7
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
sha256sums=('2cb573fb7867675de40e89d40d1b305a70b11893a20b47154ebc4356d45077b9')
b2sums=('e51945a4b93982abc95b003a79110317753b110118f0b3f294b22d1d2f1ab78382b1721b4479729589c3f73c486dc01ae757b7b8db3cc3f84094ed2a1b994cb3')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
