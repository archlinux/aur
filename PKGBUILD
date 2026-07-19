# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Automation: https://github.com/its-me/aur.github-backup

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.64.2
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e9d8e370d3a26c9d662ff3bf2a1f09ef5e9643b06531071baf0fc135bb4acc2b6305a2b67d37a8ec40ea47f4ecc79c618518ca85df6e957695c964b23d5b713d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

