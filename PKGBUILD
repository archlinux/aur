pkgname=kde-material-you-colors
pkgver=1.6.0
pkgrel=1
pkgdesc="A script to generate Material You color schemes for KDE Plasma."
arch=('any')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('MIT')
depends=('python' 'python-dbus' 'python-numpy' 'python-material-color-utilities')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('b054f3e2308d77455e3c524c8e2e36e19be0e5737ef36998ce76ebf90758a8ca')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
