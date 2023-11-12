# Maintainer: Popolon <popolon@popolon.org>

_module=pyguetzli
pkgname=python-${_module}
pkgver=1.0.15
pkgrel=3
pkgdesc="Python binding for Google’s Guetzli library"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="https://github.com/wanadev/pyguetzli"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('python')
source=("${modname}-${pkgver}.tar.gz::https://github.com/wanadev/pyguetzli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac8ed3efd59ac97af61d2b4cfd6d01f341bcad6855ffe54dffb43f0d5fc54b87')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
