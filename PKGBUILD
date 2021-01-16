# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=dust-bin
_realname="${pkgname%-bin}"
pkgver=0.5.4
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
arch=("x86_64" "i686")
url="https://github.com/bootandy/${_realname}"
license=("Apache")
provides=("${_realname}")
conflicts=("${_realname}")
source_x86_64=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('33e2f90682a29e71a492883bb857ab45aaaa2af361b57a40ea526ff399bf91eb')
sha256sums_i686=('20ea2b5696628824b59b4033d42571c09850bbc314df7e3dc31cfd32bfbd84ed')

package() {
  cd "${srcdir}/${_realname}-v${pkgver}-"*/
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_realname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
