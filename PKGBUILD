# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=3.3.3
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python2' 'ansible')
makedepends=('python2-distribute')
source=("https://github.com/willthames/ansible-lint/archive/v${pkgver}.tar.gz")
sha256sums=('05d8d851fce4ecc44701514ed890fda7daadda1d008e635d6227ff90d56cc6b0')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
