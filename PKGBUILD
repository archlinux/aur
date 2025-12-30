# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='undock'
pkgname="${_pkgname}-bin"
pkgver=0.11.0
pkgrel=1
pkgdesc='Extract contents of a container image in a local folder'
arch=('x86_64' 'aarch64')
url='https://github.com/crazy-max/undock'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('288cb0ab9fa1237ba8389e3116645fb83963998fffc260df736d114be7e9068f')
sha256sums_aarch64=('120d0c0399b3a54c03e64628acd51ab477cc245c6b17944c6086a306d6170fdb')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

