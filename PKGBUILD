# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman-bin
pkgver=4.8.3
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
arch=('x86_64')
url="https://www.getpostman.com"
license=('MIT')
source=(
	"https://dl.pstmn.io/download/latest/linux?arch=64"
)
md5sums=(
	"35d1e600bd338c19b05693928bf9cde6"
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
