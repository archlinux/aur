# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.61.5
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f9151d94769765ca0f5aa9d329599d6fde2de8b73c81a4faf7f9ea0bfef6cdaeb48d81a2ab18c2830d5c8e877be29fd4570057a2077e1fcc7712734547336126')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

