# Maintainer: lalala <lalala_233@qq.com>

_name=rustypot
pkgname=python-${_name}
pkgver=1.13.1
pkgrel=1
pkgdesc='A package to communicate with Dynamixel/Feetech motors'
url='https://github.com/pollen-robotics/rustypot'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-maturin' 'rust')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('516bbec63b69c0f73c9c1e6c82f362339472a604b8492ff1194be441202bee00')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
