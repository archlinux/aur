# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgname=peakcell-git
pkgver=r4.9a812e3
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="CSV to Excel Chart Conversion Utility"
url="https://gitlab.com/william.belanger/${pkgname%-git}"
arch=("any")
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt5" "python-openpyxl" "python-pandas" "python-scipy")
source=("git+https://gitlab.com/william.belanger/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
