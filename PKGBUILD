# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Automation: https://github.com/its-me/aur.github-backup

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.68.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e30f8aa3d424f4346ee3d6016413f057b483654deb0ae8c90e96bae01a41712ccde97925ff0a0781ad23034d885c7c28cc58ed8347418a654c0513cbcceda23b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

