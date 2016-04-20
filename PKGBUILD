# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=2.6.2
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python2' 'ansible')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/a/ansible-lint/ansible-lint-${pkgver}.tar.gz")
sha256sums=('5b034b6f3850ba25fb9b67e064d60ab345cede161fb48b7b13f4290004801feb')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
