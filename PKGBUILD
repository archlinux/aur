# Maintainer: 4censord <mail@business-insulting.de>
# Python package author: Ansible by Red Hat <info@ansible.com>
pkgname=molecule-goss
pkgver=1.1
pkgrel=1
pkgdesc="Goss Molecule Plugin :: run molecule tests with Goss as verifier"
arch=(any)
url="https://github.com/ansible-community/molecule-goss"
license=(MIT)
makedepends=("python" "python-pip")
depends=("python" "molecule")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1ff06e6c516c3700f73359a9aaafc36e56feb1886846d7ebd519b3bb10584169')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}


