# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="keyb"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="Create and view your own custom hotkey cheatsheet in the terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/kencx/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('43117be4e46e532f2a4d9efe7d54a31730236f299887b2922876bb258586c9b1')
sha256sums_i686=('59a687b0a38fbb025f8928e99f11e1072834a936336700fcd3a76d911fe60393')
sha256sums_aarch64=('6a9892074227681952d63f33db4e69298a9db4390cf433d6f6fc520673a85e6b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}