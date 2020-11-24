# Maintainer: The3DmaN <the3dman dot appdev at protonmail dot com>

pkgname=abv-calc-git
pkgver=1.1.r55.3033227
pkgrel=1
pkgdesc="ABV Calculator for Refractometers"
arch=("any")
url="https://gitlab.com/The3DmaN/${pkgname%-git}"
license=("GPL3")
depends=("git" "python>=3.8" "python-setuptools" "python-pyqt5" "qt5-svg" "python-requests")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/The3DmaN/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}

