# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='undock'
pkgname="${_pkgname}-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc='Extract contents of a container image in a local folder'
arch=('x86_64' 'aarch64')
url='https://github.com/crazy-max/undock'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6e1e20f2599d28ab59edb67a2ad5211277bf33e3a32cbaa9a2d5fe288f0f0fb2')
sha256sums_aarch64=('809fed57bc926432fefb226900d6cb4a4656f5a21c933016720acd4b1fffe967')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

