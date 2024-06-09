# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.5.1
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ff1644d6c3a71e4fad6d0df00f0a4be1608b19082ea26ea167f53297819f4707')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m unittest
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
