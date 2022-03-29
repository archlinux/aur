# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=duply_qr-git
pkgrel=2
pkgver=r6.4b63f10
pkgdesc='Backup Duply profile on a paper using QR code'
arch=('any')
url="https://github.com/jose1711/duply_qr"
license=('MIT')
depends=('duply' 'qrencode' 'enscript' 'ghostscript' 'evince' 'xpdf' 'zbar')
makedepends=('git')
md5sums=('SKIP')

source=("${pkgname}"::'git+https://github.com/jose1711/duply_qr.git')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  install -Dm755 "${srcdir}/${pkgname}/duply_qr.sh" "${pkgdir}/usr/bin/duply_qr.sh"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
