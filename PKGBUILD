# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread-git
_pkgname=gspread
pkgver=v3.0.1.r4.gf4c97b4
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-requests')
source=("git+https://github.com/burnash/gspread.git")
sha512sums=('SKIP')
conflicts=('python-gspread')

pkgver() {
   cd "gspread"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
