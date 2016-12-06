# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman-bin
pkgver=4.9.1
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
arch=('x86_64')
url="https://www.getpostman.com"
license=('MIT')
source=(
	"Postman-linux-x64-${pkgver}.tar.gz::https://dl.pstmn.io/download/latest/linux?arch=64"
)
md5sums=(
	"bf8aa61631ad846ff1d7772cb4988646"
)

package() {
	install -dm755 "${pkgdir}/opt/"
	chmod -R 755 "Postman"
	cp -r "Postman" "${pkgdir}/opt/postman"
	chmod -R 755 "${pkgdir}/opt/postman"
  	install -dm755 "${pkgdir}/usr/bin"
  	ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
	install -D -m644 "Postman/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "Postman/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
