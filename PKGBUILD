# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosu
pkgname=${_pkgbase}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Native osu! telemetry daemon with a local dashboard'
arch=('x86_64')
url='https://github.com/shiruviaa/vosu'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libelf' 'zlib' 'libcap')
makedepends=('imagemagick')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
install=vosu.install
source=(
    "vosu-linux-v${pkgver}.zip::https://github.com/shiruviaa/vosu/releases/download/v${pkgver}/vosu-linux-v${pkgver}.zip"
    "vosu.desktop::https://raw.githubusercontent.com/shiruviaa/vosu/v${pkgver}/packaging/linux/vosu.desktop"
    "vosu.svg::https://raw.githubusercontent.com/shiruviaa/vosu/v${pkgver}/assets/branding/vosu-app-icon.svg"
    "vosu-source.png::https://raw.githubusercontent.com/shiruviaa/vosu/v${pkgver}/assets/branding/vosu-app-icon.png"
)
sha256sums=(
    '5a87c69925c730658d9780b7861a79264e175f18f89010489fa6e72821961681'
    '05ad13ecd832a0496908530f8bb761ce4f4623773519dd5362295ea9a93fdc9c'
    '8db446168308b24dd86bd594166d00c3673e6e8d1cbf261cfdca38aacdf990f6'
    '8ed16ecf662a1ef7d548fe8da4a34bce0b85ef09c82a10fc04aaa4322499050e'
)

package() {
    install -Dm755 vosu \
        "${pkgdir}/usr/bin/vosu"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/vosu/LICENSE"
    install -Dm644 vosu.desktop \
        "${pkgdir}/usr/share/applications/vosu.desktop"
    install -Dm644 vosu.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vosu.svg"
    convert vosu-source.png -resize 256x256 vosu.png
    install -Dm644 vosu.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/vosu.png"
}
