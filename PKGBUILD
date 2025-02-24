# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=x-motemen
_pkgname=gore
pkgname=${_pkgname}-bin
pkgver=0.5.8
pkgrel=1
pkgdesc='Yet another Go REPL that works nicely'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'go')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a1014972053d7679e8941776be9e90a7c7613befefd2e789020702af99dd08e8')
sha256sums_aarch64=('4223843d0a2797f5ea5c30d5c7d764bbbe8291251b683a401a7dd7c11f793f5a')

package() {
  cd "${srcdir}/$(ls -d */ | head -n 1)/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
}
