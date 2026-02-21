# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=python-unzip-http
_name=${pkgname#python-}
pkgver=0.7
pkgrel=1
pkgdesc='Extract files from .zip files over http without downloading entire archive'
arch=('any')
url='https://github.com/saulpw/unzip-http'
license=('MIT')
depends=('python' 'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_name}-${pkgver}.tar.gz::https://github.com/saulpw/unzip-http/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f834bd87c11d51c092f0ed8b3d0bb924d9f74d2970208cdf5366163aabc966a')

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
