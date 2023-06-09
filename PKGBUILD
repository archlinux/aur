# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pyproject-appimage
pkgver=3.0
pkgrel=1
pkgdesc="Generate AppImages from your Python projects"
arch=("any")
url="https://codeberg.org/JakobDev/pyproject-appimage"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/pyproject-appimage/archive/${pkgver}.tar.gz")
sha256sums=("6e578762a605e1cd9ecb5acd13a71a11a0ad9a44c6c2aee1eb86c3451b3eedaa") 

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
