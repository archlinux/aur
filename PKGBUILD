# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=frigate-notify-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Event notifications for Frigate NVR"
arch=('x86_64' 'aarch64')
url="https://github.com/0x2142/frigate-notify"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/frigate-notify_Linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/frigate-notify_Linux_arm64.zip")
sha256sums_x86_64=('944b180e8b3eb53a6ef2a794f49e1d413e40099ad25a0f4c815978f83d5c7663')
sha256sums_aarch64=('d939b8af57c06b31e5580563e397ec855e67850562401a56563fd05cb80f59b9')

package() {
  install -Dm755 "frigate-notify" "${pkgdir}/usr/bin/frigate-notify"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
