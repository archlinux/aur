# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-bin
pkgver=1.13
pkgrel=2
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
depends=('glibc')
provides=('shell2http')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msoap/shell2http/releases/download/${pkgver}/shell2http-${pkgver}.linux.amd64.tar.gz")
sha256sums=('3da989b4022603e4a792cbeb7f356fe72a59a185d6a40adab48b656178888d4d')

package() {
	gzip --force "${srcdir}"/shell2http.1
	install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 shell2http.1.gz -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et: