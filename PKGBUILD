# Maintainer: Zakros

_pkgname='ssh-chat'
pkgname="${_pkgname}-bin"
pkgver=1.10
pkgrel=3
pkgdesc='Chat over SSH'
arch=('x86_64' 'i386' 'arm')
url='https://github.com/shazow/ssh-chat'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tgz")
source_i386=("${_pkgname}-${pkgver}-armv7h.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_arm.tgz")
source_arm=("${_pkgname}-${pkgver}-aarch64.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_arm.tgz")

sha256sums=('SKIP')

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
