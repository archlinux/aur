# Maintainer: Yakkhini <sign@yechanv.cc>
pkgname='pong-planting'
pkgver=0.1.0
pkgrel=1
pkgdesc="A ECS driven breakout game, writen in Rust, Bevy engine."
arch=('x86_64')
url="https://github.com/Yakkhini/PongPlanting"
license=('custom:Mulan PSL v2')
depends=(alsa-lib systemd-libs)
source=("https://github.com/Yakkhini/PongPlanting/releases/download/v0.1.0/pong_planting"
        "https://github.com/Yakkhini/PongPlanting/archive/refs/tags/v0.1.0.tar.gz")
noextract=("pong_planting")
sha256sums=('23dabf68639be22cef670193797deba5672ac24d225940634f352413ba6ff071'
            '491da2d4b7b132676067715448ba99dc33b184eef3578e2e197e5efa437a1c6b')

package() {
    install -Dm755 "pong_planting" "${pkgdir}/usr/bin/pong-planting"
    install -Dm644 "PongPlanting-0.1.0/LICENSE" "${pkgdir}/usr/share/licenses/pong-planting/LICENSE"
    install -Dm644 "PongPlanting-0.1.0/assets/fonts"/* -t "${pkgdir}/usr/share/pong-planting/assets/fonts/"
    install -Dm644 "PongPlanting-0.1.0/assets/scenes"/* -t "${pkgdir}/usr/share/pong-planting/assets/scenes/"
    install -Dm644 "PongPlanting-0.1.0/assets/sprites"/* -t "${pkgdir}/usr/share/pong-planting/assets/sprites/"
    install -Dm644 "PongPlanting-0.1.0/assets"/*.wgsl -t "${pkgdir}/usr/share/pong-planting/assets/"
}
