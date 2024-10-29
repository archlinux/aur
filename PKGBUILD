# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.24.1
pkgrel=1
pkgdesc='A command-line tool to download photos from iCloud'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/icloud-photos-downloader/icloud_photos_downloader'
license=('MIT')
provides=('icloudpd')
conflicts=('icloudpd')

source=("LICENSE::${url}/raw/master/LICENSE.md")

_ghbin="${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_ghbin}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_ghbin}-linux-arm64")
source_armv7h=("${pkgname}-${pkgver}-armv7h::${_ghbin}-linux-arm32v7")

sha256sums=('bb04f6adb55cf312f3f5fefc559bf332bc8fb2bd680e309041449c18644ae385')
sha256sums_x86_64=('8ec4e1459237303bd1ced4da613f19d84c67f36181e043f65e5d94a56199116b')
sha256sums_aarch64=('8cee8682ca5a8338eccdf983c70a16d89f582ec18a240229260535a36e7ea593')
sha256sums_armv7h=('0555c97373e9a740ea16a8464a60432b0485e4a802c87c85a61041667a9ce2cd')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
