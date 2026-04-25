# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='undock'
pkgname="${_pkgname}-bin"
pkgver=0.13.0
pkgrel=1
pkgdesc='Extract contents of a container image in a local folder'
arch=('x86_64' 'aarch64')
url='https://github.com/crazy-max/undock'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9da411f3acdad308fbf301c52decff6f8b03d3432d9dcf79dc8ada93c0323363')
sha256sums_aarch64=('251724dfdb0670b9dc502e919655edc2a1ed74129cff75e76b97006b815de343')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

