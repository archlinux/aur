# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.62.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6af5ef9acc11e22613eb33aa254e1f910021981b0f41c184604335ad91d2e38eda046bfb87ef27d00e9f530374cd7650294c1fa5dc1510a1ea965e5a1c870874')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

