# Maintainer: Popolon <popolon@popolon.org>

_module='mozjpeg-lossless-optimization'
_module_underscore="${_module//-/_}"
pkgname=python-${_module}
pkgver='1.3.2'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('cmake' 'python-build' 'python-installer' 'python-pip' 'gcc')
license=('BSD')
arch=(${CARCH})
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module_underscore-$pkgver.tar.gz")
sha256sums=('4d150f63b19831b22918118de0f85bcf17e167858700cbd6517da888ca6c59a6')

build() {
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=()
  cd "${srcdir}/${_module_underscore}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
