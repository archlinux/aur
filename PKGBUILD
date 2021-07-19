# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=dust-bin
_realname="${pkgname%-bin}"
pkgver=0.6.1
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
arch=("x86_64" "i686")
url="https://github.com/bootandy/${_realname}"
license=("Apache")
provides=("${_realname}")
conflicts=("${_realname}")
source_x86_64=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0c3b24db57e7ca40ceff07e87ba8274e1fe0cfd6b09b282a8792ec96bd58d1e7')
sha256sums_i686=('7ce39d0d0265b86fa26d4a852e246a5f68f8597ac77a4abde5656e25ac964ade')

package() {
  cd "${srcdir}/${_realname}-v${pkgver}-"*/
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_realname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
