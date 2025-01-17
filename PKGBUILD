# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Lifailon
_pkgname=lazyjournal
pkgname=${_pkgname}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums=('003691f02cd7daac075ce43b0934ee248498ad462a22c38a2e7eb1a0ff48393b'
            '12369e9fd3e6b4b6caeedbc2472e1e9f326776a691d670e15420b2a1ce374ced')
sha256sums_x86_64=('0b540ea8a549778503d5f2cf6bcfe358244df9826cafd8a4445502744019cc46')
sha256sums_aarch64=('9202844e0a4aba7beccedaf9dfbefe068f1ac859f6b118862f9dfd2007c85713')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
