# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Lifailon
_pkgname=lazyjournal
pkgname=${_pkgname}-bin
pkgver=0.8.0
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
            'b5b94accff65628420bc078c127e6fb90fafcdc169fb6498dd09f0ebb2a4277b')
sha256sums_x86_64=('f21c2ced78fa140a4d0bbbc99b46da06cb6a1d72d745213bab55ebc71d726599')
sha256sums_aarch64=('35d9b415dddb919c5d8af588d272aa561455adf629c43183d1068f7cbd6e102a')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
