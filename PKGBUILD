# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.5.5
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
# backup=(etc/spoofdpi.toml)
options=(!debug)
source=(
  "${__pkgname}.service"
)
source_x86_64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('8a61496c8621adbbc7b986388f9b2107e4c080d0d6e4d5a8dcb31a992dbc6ffc')
sha256sums_x86_64=('654f54219f2ec099d4bd0ebbc99d907450efe7f08b45c51d8bd079671c8585fa')
sha256sums_armv7h=('f8ef3f41b0003313a181ffe4994cf3f270999766a99d9e7cc1e465a67796b6ce')
sha256sums_aarch64=('b8b389314c5906247a6ab209a81599c27a4766c400ba30af7de29fd1becd5c24')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
