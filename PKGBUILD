# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=5.1.1
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-requests')
source=("https://github.com/burnash/${_pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('4c7ef4a209fcdb4998dc83ef1e0de637c61b5d80dcf3ce13ffab730cfea66d303cea311b651bd700fa07113ec7d7aa4d3d1e56bd5c59f1bd1f936ba36401fd72')
