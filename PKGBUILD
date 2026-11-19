# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.6.0
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
sha256sums_x86_64=('ee2a4bdb5f9f13e96d952896bf501cad0a75d80bed0a498dc21d44e36b8e8aa1')
sha256sums_armv7h=('ea123d8e8fdbd3209bd7f160bd03fcc90d516dc96719016ef0014775054a42ac')
sha256sums_aarch64=('0153239b7ab2b195c136d0646d519ec23f510ba38d37573a1363d23e1d5e5b33')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
