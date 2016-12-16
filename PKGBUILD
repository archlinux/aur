# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=3.4.8
pkgrel=2
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python2' 'ansible')
makedepends=('python2-distribute')
source=("https://github.com/willthames/ansible-lint/archive/v${pkgver}.tar.gz")
sha256sums=('d6fb2cd6a3f5918e5bfc37de4d126ce76a6187a307c6f3528230bf69053e3c74')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
