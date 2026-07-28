# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Automation: https://github.com/its-me/aur.github-backup

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.65.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5bc1e80d56134959590c76f0ef77df16740d228d44c3cd07df6438d9406548a1053d779dc785185595013d0212a2c9d8335c94440a642ebdf541f72b14ea6c07')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

