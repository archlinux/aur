# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=2.0.3
pkgrel=2
pkgdesc="checks playbooks for practices and behaviour that could potentially be improved"
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python2' 'ansible')
makedepends=('python2-distribute' )
source=("https://pypi.python.org/packages/source/a/ansible-lint/ansible-lint-${pkgver}.tar.gz")
sha256sums=('19636c2809adcd35b2251a3a11bbfa2aed881f2da1f4a8c814766c39d41e3387')

build() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/ansible-lint-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}
