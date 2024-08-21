# Maintainer: Dave Shoreman <aur [plus] mpv-thumbnail-script at dsdev dot io>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mpv-thumbnail-script
pkgver=0.5.4
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
sha256sums=('cfaf11884de3ec20269efd201e23fdb41be68900bc7a5fa180d53df095ce8adf'
            '8d1e26129e5f55ba60e16a32292180e9e76226610785e2d83e10ae02a62fe2f3'
            '6e56132597a906831e172900e88962c5cbe1a92495afe2d68b4cc7b193d28ab1')

package() {
    local scripts="${pkgdir}/usr/share/mpv/scripts"

    install -Dm644 "${srcdir}/mpv_thumbnail_script_server.lua" -t "$scripts"
    install -Dm644 "${srcdir}/mpv_thumbnail_script_client_osc.lua" -t "$scripts"
    install -Dm644 "mpv_thumbnail_script.conf" -t "${pkgdir}/etc/mpv/script-opts"
}
