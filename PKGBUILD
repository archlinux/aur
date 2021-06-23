# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=dust-bin
_realname="${pkgname%-bin}"
pkgver=0.6.0
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
arch=("x86_64" "i686")
url="https://github.com/bootandy/${_realname}"
license=("Apache")
provides=("${_realname}")
conflicts=("${_realname}")
source_x86_64=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('585892cc787941bd395f2b09ab1478a943ec2c84b43572a82dd021a6edf7fb64')
sha256sums_i686=('2005739406d5785e627142331db318e7f2d8f58c332080991e58af434331d386')

package() {
  cd "${srcdir}/${_realname}-v${pkgver}-"*/
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_realname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
