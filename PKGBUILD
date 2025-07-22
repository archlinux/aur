# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.29.2
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
sha256sums_x86_64=('5e656a2b27ec59751128dea61dd7c43672b477a0a02723ec2b977d63e06319f5')
sha256sums_aarch64=('91667968199912b5b17ade0c58874b32ffaab4344eef55b8882938d5877f8168')
sha256sums_armv7h=('dc33dfabb309e9a76ea25750cdec7ee2a317ea608aa709864d7cd3dcb5ca0f5c')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
