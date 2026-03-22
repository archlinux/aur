# Maintainer: A S H <shadowash8 at protonmail dot com>
pkgname=paddock-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A random F1 quote or meme terminal ASCII art generator"
arch=('any')
url="https://github.com/shadowash8/paddock"
license=('MIT')
depends=('python' 'python-pyfiglet')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
