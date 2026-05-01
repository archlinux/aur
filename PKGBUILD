# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=github-backup
_pkgname=python-github-backup
pkgver=0.62.1
pkgrel=1
pkgdesc="Backup a github user or organization."
arch=(any)
url="https://github.com/josegonzalez/python-github-backup"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josegonzalez/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f265deca8bdd9fcbf5d592a1ccee4dfd94ce8ce8529cb981f34e4a2da7d31e6d0f28de93bc2382d04b3391617a9ca5fb1943b258d57199947baea4ed8e2c3dea')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

