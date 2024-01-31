# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.17.3
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
sha256sums_x86_64=('67e925fc19651364ca0c490ea1aea099f3ff1f73903af97cdf8bb3fcb4a445e8')
sha256sums_aarch64=('5a7e2dc09b989bc281a67cb78cc0a600392d944c33876e218267681488edb3d6')
sha256sums_armv7h=('b0b074480a8729c80660bf582d3be25734aa28775f9a74d5929775bee01f242f')
sha256sums_i686=('cd8f036ed17c30bedb44f4f1627b0fa3b9d4e3e212181c386c4970894b616c82')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
