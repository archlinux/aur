# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=x-motemen
_pkgname=gore
pkgname=${_pkgname}-bin
pkgver=0.6.1
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
sha256sums_x86_64=('ddd5c1681a4639c6ada0b1e07646de9391b60b042127f6c9edc81ce5134131a0')
sha256sums_aarch64=('6d3d4104f1c1a4e1e87f0e1c1895160b16092fdec56bb2e365d24b936184ae5a')

package() {
  cd "${srcdir}/$(ls -d */ | head -n 1)/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
}
