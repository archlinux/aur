# Maintainer: Popolon <popolon@popolon.org>

_module=pyguetzli
pkgname=python-${_module}
pkgver=1.0.17
pkgrel=1
pkgdesc="Python binding for Google’s Guetzli library"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="https://github.com/wanadev/pyguetzli"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('python')
source=("${_module}-${pkgver}.tar.gz::https://github.com/wanadev/pyguetzli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71d061487410573aa7915c74071cdc5268100da9fcef24fa1e294390767002c9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
