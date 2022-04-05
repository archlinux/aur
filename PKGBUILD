# Maintainer: Dave Shoreman <aur [plus] mpv-thumbnail-script at dsdev dot io>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mpv-thumbnail-script
pkgver=0.4.8
pkgrel=2
pkgdesc="A Lua script to show preview thumbnails in mpv's OSC seekbar, sans external dependencies"
arch=('any')
url='https://github.com/marzzzello/mpv_thumbnail_script'
license=('GPL3')
depends=('mpv')
optdepends=('ffmpeg')
install=mpv-thumbnail-script.install
source=("${url}/releases/download/${pkgver}/mpv_thumbnail_script_server.lua"
    "${url}/releases/download/${pkgver}/mpv_thumbnail_script_client_osc.lua"
    'mpv_thumbnail_script.conf')
sha256sums=('b974b01fa4283d72404852e12898253ccbf41da9ea1332536bd96a162d1acc46'
            '3d320f50da3b1368d901bdbb78002be3750fd5161af4bf47acf5ebbcaf6be330'
            '2cf5f96a0ef0ff96ec64a05af3392dd0d3a4fd2bad283c2d14d61e21a3634cac')

package() {
    local scripts="${pkgdir}/usr/share/mpv/scripts"

    install -Dm644 "${srcdir}/mpv_thumbnail_script_server.lua" -t "$scripts"
    install -Dm644 "${srcdir}/mpv_thumbnail_script_client_osc.lua" -t "$scripts"
    install -Dm644 "mpv_thumbnail_script.conf" -t "${pkgdir}/etc/mpv/script-opts"
}
