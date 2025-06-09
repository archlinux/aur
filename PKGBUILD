# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pyproject-appimage
pkgver=4.1
pkgrel=1
pkgdesc="Generate AppImages from your Python projects"
arch=("any")
url="https://codeberg.org/JakobDev/pyproject-appimage"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/pyproject-appimage/archive/${pkgver}.tar.gz")
sha256sums=("008f7448532ae899f39e228e033fcbe8143aa9aea05cca0741d32b6b54fec831") 

build() {
      cd "pyproject-appimage"
      python -m build --wheel --no-isolation
}

package() {
      cd "pyproject-appimage"
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
