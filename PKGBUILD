# Maintainer: Philipp Marmet

pkgname=mgmt-bin
pkgver=1.1.0
pkgrel=0

pkgdesc='Next generation config management.'
arch=('x86_64' 'aarch64')
url="https://github.com/purpleidea/mgmt"
license=('GPL-3.0-only')
depends=('augeas' 'libvirt' 'libxml2-legacy')
backup=("etc/mgmt/mgmt.conf")
conflicts=('mgmt')
options=('!strip' '!debug')

source=("mgmt-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
source_x86_64=("mgmt-${pkgver}-bin"::"${url}/releases/download/${pkgver}/mgmt-linux-amd64-${pkgver}")
source_aarch64=("mgmt-${pkgver}-bin"::"${url}/releases/download/${pkgver}/mgmt-linux-arm64-${pkgver}")

sha256sums=('91c18b48e7c73f02bd5a896c155787440aa868ce806a42be0d6df884b0a87494')
sha256sums_x86_64=('078bd01ec69f2b5dcadec7a6ed82aa9cbcf128718474160acd4c61d17442f270')
sha256sums_aarch64=('078bd01ec69f2b5dcadec7a6ed82aa9cbcf128718474160acd4c61d17442f270')

package() {
  install -Dm755 "mgmt-${pkgver}-bin" "${pkgdir}/usr/bin/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/example.conf" "${pkgdir}/etc/mgmt/mgmt.conf"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"
}
