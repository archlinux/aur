# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=python-unzip-http
_name=${pkgname#python-}
pkgver=0.6
pkgrel=1
pkgdesc='Extract files from .zip files over http without downloading entire archive'
arch=('any')
url='https://github.com/saulpw/unzip-http'
license=('MIT')
depends=('python' 'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_name}-${pkgver}.tar.gz::https://github.com/saulpw/unzip-http/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ee87473701a87ba658e31c53ee567a4e62b80f0e7bdbc2cdd21cccdfb15f50a')

build() 
{
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package()
{
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
