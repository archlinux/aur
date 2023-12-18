pkgname=kde-material-you-colors
pkgver=1.7.0
pkgrel=1
pkgdesc="A script to generate Material You color schemes for KDE Plasma."
arch=('any')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('MIT')
depends=('python' 'python-dbus' 'python-numpy' 'python-material-color-utilities')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('425a6bf3e6661de1f61876c446d0405a2a519657898defcffa53150c86afc686')

build() {
  cd "${srcdir}/${pkgname}-$pkgver-beta1"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver-beta1"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
