# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.17.5
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
sha256sums_x86_64=('dd987d532b416426ef916477575b4b3118de048dccf3ad845b8e016f0c6c93f5')
sha256sums_aarch64=('b3bc7b5a54d367dc3d8ffb83842f9ca017445924773b9e4e8743854937fb6a33')
sha256sums_armv7h=('2fc3e0934e8a29e0042e86fff083f90ff81f2e18e82965a90a6f6ecb8094b0df')
sha256sums_i686=('0347adc5d630689675572ab8ba645d88b94b6a9b9d1c472914f6f42b41363483')

package() {
  install -Dm755 ${pkgname}-${pkgver}-${CARCH} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
