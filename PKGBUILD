# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.19.0
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
sha256sums_x86_64=('788d4462baf5d514bcf3084ccd20a92168d34a6e01f23899c3ca51644c3d8789')
sha256sums_aarch64=('79ee83e3741d97b769910711100e142cf0ae751255c728feddcc7db6c246fe02')
sha256sums_armv7h=('12aa757bfee3da4a4e606f95d8697a4a59d3fd221604d00e96b56dca8cc974b0')
sha256sums_i686=('7682915c86c28dba515266aabb8c775c6402c902b735bcc3ccd1625a78bd5ca4')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
