# Maintainer: Dave Shoreman <aur [plus] mpv-thumbnail-script at dsdev dot io>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mpv-thumbnail-script
pkgver=0.4.9
pkgrel=1
pkgdesc="A Lua script to show preview thumbnails in mpv's OSC seekbar, sans external dependencies"
arch=('any')
url='https://github.com/marzzzello/mpv_thumbnail_script'
license=('GPL3')
depends=('mpv')
optdepends=('ffmpeg')
install=mpv-thumbnail-script.install
backup=('etc/mpv/script-opts/mpv_thumbnail_script.conf')
source=("${url}/releases/download/${pkgver}/mpv_thumbnail_script_server.lua"
    "${url}/releases/download/${pkgver}/mpv_thumbnail_script_client_osc.lua"
    'mpv_thumbnail_script.conf')
sha256sums=('c60bd5fd4de2d408fb13d787e409ab991b9ff4abef47fbb57c13c051f059bf99'
            'e563e028874addec62b5717aec8b5c30a68177f9b73928db7f8e90ce8be09ce2'
            'f3de4ac15a06b6d0f4e0668aeac348e97f502c9271e5a09da94d7b9a5b0156cb')

package() {
    local scripts="${pkgdir}/usr/share/mpv/scripts"

    install -Dm644 "${srcdir}/mpv_thumbnail_script_server.lua" -t "$scripts"
    install -Dm644 "${srcdir}/mpv_thumbnail_script_client_osc.lua" -t "$scripts"
    install -Dm644 "mpv_thumbnail_script.conf" -t "${pkgdir}/etc/mpv/script-opts"
}
