# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-bin
pkgver=1.14.1
pkgrel=1
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
depends=('glibc')
provides=('shell2http')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msoap/shell2http/releases/download/v${pkgver}/shell2http_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cbd16aadcb627ae98630aa680407a53e79330f228a890f11b4a7ab4faf1b65e5')

package() {
  gzip --force "${srcdir}"/shell2http.1
  install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1.gz -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
