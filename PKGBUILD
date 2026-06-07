# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.32.3
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
sha256sums_x86_64=('cbe4de08f715a9b524795eccd75f33a97661cd27fa7f0282c58611d760fce093')
sha256sums_aarch64=('b869453b8282f50c9e7e79d96d1a11f1f9d126e8017b395fa62fd04e1acd3031')
sha256sums_armv7h=('4d715899ba70c773775e03943867d6e2588fc48b4bd7fcfa414ae30ba9070d1b')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
