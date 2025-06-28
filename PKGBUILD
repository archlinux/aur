# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pyproject-appimage
pkgver=4.2
pkgrel=2
pkgdesc="Generate AppImages from your Python projects"
arch=("any")
url="https://codeberg.org/JakobDev/pyproject-appimage"
license=("BSD")
depends=("python" "python-requests" "python-desktop-entry-lib")
makedepends=("python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/pyproject-appimage/archive/${pkgver}.tar.gz")
sha256sums=("af46e77c1c560a0d8ae42a279e8d612a2bca00ad0fdeb2d3b89c9f72be31abaa") 

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
