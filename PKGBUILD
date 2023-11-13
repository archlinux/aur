# Maintainer: Popolon <popolon@popolon.org>

_module='mozjpeg-lossless-optimization'
pkgname=python-${_module}
pkgver='1.1.3'
pkgrel=5
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('cmake' 'python-build' 'python-installer' 'python-pip' 'gcc')
license=('BSD')
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('725d98772e943fca18b0801cb94e645c477ff52e56ad0b27bddb76ddf091ca3e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python  -m installer --destdir="${pkgdir}" dist/*.whl
}
