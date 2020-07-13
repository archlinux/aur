# Maintainer: mocihan <ly50247@126.com>
pkgname=dust-bin
_realname="${pkgname%-bin}"
pkgver=0.5.1
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
arch=("x86_64" "i686")
url="https://github.com/bootandy/${_realname}"
license=("Apache")
provides=("${_realname}")
conflicts=("${_realname}")
source_x86_64=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d84bf075530a555c2ae23fd042ab25756252d6cb7395b5505366c19cbaf45a5d')
sha256sums_i686=('15c8ae2c927b6d93cd78290163fead4b0c5ff5103c3240cb90cefdbdacd8a6f1')

package() {
  cd "${srcdir}/${_realname}-v${pkgver}-"*/
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_realname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
