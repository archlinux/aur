# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pocketdev-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Run your AI coding CLI on a Tailscale-only server and code from your phone"
arch=('x86_64' 'aarch64')
url="https://github.com/0xMassi/pocketdev"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pocketdev_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pocketdev_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b256d16d8f162679f2b4a33ccc5860a3f221de9bed01f0fa8894ce3bcd9f5af0')
sha256sums_aarch64=('c554c5cfeef85d2f977ae1bb3fb196dcf988d959a232e1a1ef580fd56dde4959')

package() {
  install -Dm755 "pocketdev" "${pkgdir}/usr/bin/pocketdev"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
