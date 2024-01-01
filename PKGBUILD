# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.5.0
pkgrel=2
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf40d32d26d785b424a08a15e415987cc44547032c396338d4f19a66060eaba0')

check() {
  cd "${pkgname}-${pkgver}"
  python -m unittest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
