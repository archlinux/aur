# Maintainer: figr <figr@gmx.de>
pkgname=music-ratatui-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="A terminal musicplayer build with Ratatui."
arch=('x86_64')
url="https://gitlab.com/figr/music-ratatui"
license=('GPL-3.0')
depends=('gcc' 'sqlite')
conflicts=('music-ratatui' 'music-ratatui-debug')
makedepends=('rust' 'cargo' 'pkgconf' 'git' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
source=(
    "https://gitlab.com/api/v4/projects/76572256/packages/generic/x86_64-linux/v${pkgver}/music-ratatui-bin_${pkgver}_linux"
    "https://gitlab.com/figr/music-ratatui/-/raw/main/LICENSE"

)
options=('!lto')
sha256sums=('bbcd3541d39d7bdbcd344bad2934920ae740b4a80ad8852c43179a8de0eb45e0'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')


package() {
    install -Dm755 "${srcdir}/music-ratatui-bin_${pkgver}_linux" "${pkgdir}/usr/bin/music-ratatui"

    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/music-ratatui/"
}
