# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.17.6
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
sha256sums_x86_64=('21495f5ff6bf8e42d8714d7ba297089a4b513653285a0c8ac3c6ce501f20480f')
sha256sums_aarch64=('516c820896aa778d5259137aaa4c07fff15e8c1126b3ef4637c66704d1aa50a5')
sha256sums_armv7h=('13c4e06a3bce48bfa010285f450d1d59851da4f1b004e892a617541ee3650d07')
sha256sums_i686=('a4c91ea9073408ab9c4d089da68dc5beb1b980deb7ffd44ea95c4ce02add51ee')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
