# Maintainer: user20159 <public[aT]lrose.de>

pkgbase='python-ansible-vault-rekey'
pkgname='python-ansible-vault-rekey'
pkgver=2.0.1
pkgrel=1
pkgdesc="Rolls keys and re-encrypts secrets in any repo using Ansible Vault "
url="https://github.com/inhumantsar/python-ansible-vault-rekey"
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'gcc' 'libffi' 'openssl')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("git+https://github.com/inhumantsar/python-ansible-vault-rekey/#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${pkgbase}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgbase}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${srcdir}/${pkgbase}"
    python -m pytest tests/*.py
}
