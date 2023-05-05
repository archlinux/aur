# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-python-tests
pkgver=0.2.1
_commit=95edea9fa7cba66b29fbf0b9dbbedcd3223597f4
pkgrel=1
pkgdesc='Osmocom tools for testing VTY/CTRL interfaces'
url='https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests'
license=('GPL')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests.git#commit=$_commit"
        "0001-setup.py-do-not-install-deprecated-scripts.patch")
sha256sums=('SKIP'
            '2a91e21f088d1471dfa7bd043c86d93385bc3cb8c1beb6405e4cdff8ec7aec60')

prepare() {
  patch --directory="${pkgname}" -p1 -i "${srcdir}/0001-setup.py-do-not-install-deprecated-scripts.patch"
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
