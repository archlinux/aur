# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mpv-thumbnail-script
pkgver=0.4.7
pkgrel=1
pkgdesc="A Lua script to show preview thumbnails in mpv's OSC seekbar, sans external dependencies"
arch=('any')
url='https://github.com/marzzzello/mpv_thumbnail_script'
license=('GPL3')
depends=('mpv' 'ffmpeg')
install=mpv-thumbnail-script.install
source=("${pkgname}-server.lua::${url}/releases/download/${pkgver}/mpv_thumbnail_script_server.lua"
    "${pkgname}-client-osc.lua::${url}/releases/download/${pkgver}/mpv_thumbnail_script_client_osc.lua")
sha256sums=('e356324e8068721fdbbe401641561fa13392f02ed5166d873bc63cc2962941ee'
    'dc3029757fc8357d818c4bd64882e6dd34fb5c52ecff4c3abf9cdd37d684caba')

package() {
    local scripts="${pkgdir}/usr/share/mpv/scripts"

    install -Dm644 "${srcdir}/${pkgname}-server.lua" -t "$scripts"
    install -Dm644 "${srcdir}/${pkgname}-client-osc.lua" -t "$scripts"
}
