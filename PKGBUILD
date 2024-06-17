# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.20.0
pkgrel=1
pkgdesc='A command-line tool to download photos from iCloud'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/icloud-photos-downloader/icloud_photos_downloader'
license=('MIT')
provides=('icloudpd')
conflicts=('icloudpd')

source=("LICENSE::${url}/raw/master/LICENSE.md")

_ghbin="${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_ghbin}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_ghbin}-linux-arm64")
source_armv7h=("${pkgname}-${pkgver}-armv7h::${_ghbin}-linux-arm32v7")
source_i686=("${pkgname}-${pkgver}-i686::${_ghbin}-linux-386")

sha256sums=('bb04f6adb55cf312f3f5fefc559bf332bc8fb2bd680e309041449c18644ae385')
sha256sums_x86_64=('f7fb837680a9ed9391c856450214eae13171cda69f72b416bbf90e7ba8f9b0d9')
sha256sums_aarch64=('8f594bb2671b933926364025388085ccf423d25c0a77d99880516b3324a44926')
sha256sums_armv7h=('a870df14835f238dae61c912e1c2a22b9790eaa1bfd6c9dd517f8737b1ea412f')
sha256sums_i686=('e13d650f1aa842db9d4c8c9138c879b4c37b12d2252fcfbaa60f0123b3c1cac9')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
