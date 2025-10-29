# Maintainer: Philipp Marmet

pkgname=mgmt-bin
pkgver=1.0.1
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

sha256sums=('1b0c8b6efc2c3064955d8dd3cadc6b11b9195ec07e33f0bf5e115a0e113494d6')
sha256sums_x86_64=('293d98e95813b627b343ae6c5e34d16e3cd28d45d481e479cc8d771a2096ad34')
sha256sums_aarch64=('293d98e95813b627b343ae6c5e34d16e3cd28d45d481e479cc8d771a2096ad34')

package() {
  install -Dm755 "mgmt-${pkgver}-bin" "${pkgdir}/usr/bin/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/mgmt"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/example.conf" "${pkgdir}/etc/mgmt/mgmt.conf"
  install -Dm644 "${srcdir}/mgmt-${pkgver}/misc/mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"
}
