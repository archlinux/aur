# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Automation: https://github.com/its-me/aur.github-backup

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.66.1
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('874692e0b33291416fa10b2d9f636ef8710b3509e31aa131bd5b800aa1001554cd31106f6435226f6cc98548b1a9cf0eee32faa3c854bf86e22266e6150004f3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

