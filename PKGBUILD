# Maintainer: Ninso112
pkgname=wakewhy
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight CLI tool to identify why a Linux system woke from suspend/sleep mode"
arch=('any')
url="https://github.com/Ninso112/wakewhy"
license=('GPL3')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
source=("${pkgname}::git+https://github.com/Ninso112/wakewhy.git#branch=main")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
