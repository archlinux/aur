# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Automation: https://github.com/its-me/aur.github-backup

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.66.0
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('213d57b9329194a9e04b5916f5a4c29d8fb88d5a29270b929e5f2439b43ecdcfce5695aa86648f351d1ec8ba72630c96d7949c9ae5936c35e9402757a3f2cb0a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

