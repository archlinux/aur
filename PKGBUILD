# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=5.7.2
pkgrel=2
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-google-auth' 'python-google-auth-oauthlib')
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

sha512sums=('5d18620bef64b37239a7ecb0120bfa9f0a8b1267de304ecaa2a16c6b41a0284f6bc1877f595e16a7274c090eecaea59cca1d92cce798d21e823c0ae142300fab')
