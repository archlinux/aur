# Maintainer: Philipp Marmet

pkgname=mgmt-bin
pkgver=1.0.2
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

sha256sums=('de68bba23b8cd63d9c81ae52bab293cdf7a7641c39b83c48a1d533ac37c0fa26')
sha256sums_x86_64=('53770fd2c5da299d61a4eb0ae1cec631150bca578c20b65be9e0a1cc23924d5d')
sha256sums_aarch64=('53770fd2c5da299d61a4eb0ae1cec631150bca578c20b65be9e0a1cc23924d5d')

package() {
  install -Dm755 "mgmt-${pkgver}-bin" "${pkgdir}/usr/bin/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/example.conf" "${pkgdir}/etc/mgmt/mgmt.conf"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"
}
