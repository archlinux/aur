# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=dust-bin
_realname="${pkgname%-bin}"
pkgver=0.5.3
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
arch=("x86_64" "i686")
url="https://github.com/bootandy/${_realname}"
license=("Apache")
provides=("${_realname}")
conflicts=("${_realname}")
source_x86_64=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/bootandy/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('4580972fd9e210112c0dfb54ce0c21e4ddff056c92c0d3ea83ce7e670418d3b1')
sha256sums_i686=('7501be90091eb61aee6869b62dfb514eff35961eaa3adc732f107d7338de8286')

package() {
  cd "${srcdir}/${_realname}-v${pkgver}-"*/
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_realname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
