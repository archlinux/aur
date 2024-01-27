# Maintainer: overrule <basbasbas at protonmail dot com>
pkgname=icloudpd-bin
pkgver=1.17.3
pkgrel=1
pkgdesc='A command-line tool to download photos from iCloud'
arch=('x86_64')
url='https://github.com/icloud-photos-downloader/icloud_photos_downloader'
license=('MIT')
provides=('icloudpd')
conflicts=('icloudpd')

source=("${pkgname}-${pkgver}::https://github.com/icloud-photos-downloader/icloud_photos_downloader/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64"
        "LICENSE::https://github.com/icloud-photos-downloader/icloud_photos_downloader/raw/master/LICENSE.md")

sha256sums=('67e925fc19651364ca0c490ea1aea099f3ff1f73903af97cdf8bb3fcb4a445e8'
            'bb04f6adb55cf312f3f5fefc559bf332bc8fb2bd680e309041449c18644ae385')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
