# Maintainer: Popolon <popolon@popolon.org>

_module='mozjpeg-lossless-optimization'
_module_underscore="${_module//-/_}"
pkgname=python-${_module}
pkgver='1.2.0'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('cmake' 'python-build' 'python-installer' 'python-pip' 'gcc')
license=('BSD')
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module_underscore-$pkgver.tar.gz")
sha256sums=('f58a7bb522df2996e08650b1b5e9fdea4e9cb68ab56710f71bea21be87d60aa9')

build() {
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=()
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
