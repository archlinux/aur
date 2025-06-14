# Maintainer: Popolon <popolon@popolon.org>

_module='mozjpeg-lossless-optimization'
_module_underscore="${_module//-/_}"
pkgname=python-${_module}
pkgver='1.3.0'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('cmake' 'python-build' 'python-installer' 'python-pip' 'gcc')
license=('BSD')
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module_underscore-$pkgver.tar.gz")
sha256sums=('e43684b81d2cfdcc5672c96fc6ca9bc55c429f5c903d748c6edfcfd6e8ecf707')

build() {
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=()
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
