# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=2.3.2
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python2' 'ansible')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/a/ansible-lint/ansible-lint-${pkgver}.tar.gz")
sha256sums=('acd8bea93e77a81659354268e993f3c70386265a91acb5403eae56bd4e2c83a9')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
