# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=tetherback
pkgver=0.9.1
pkgrel=1
pkgdesc='Create backups of an Android device over USB (requires adb and TWRP recovery).'
arch=(any)
url='https://github.com/dlenski/tetherback'
license=(GPL3)
depends=(python-progressbar python-tabulate)
optdepends=('adb: android-sdk-platform-tools')
makedepends=(python-setuptools unzip)
source=("https://github.com/dlenski/tetherback/archive/${pkgver}.zip")
sha256sums=(6d3f4bb518ce8017c23668ffb3c3daa2c41d6f64a94ddc36a32972048379512c)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
