# Maintainer: czyt <czytcn@gmail.com>
pkgname=uu-remote-bin
pkgver=0.1.5
pkgrel=2
pkgdesc="非官方 UU 远程 Linux 被控端，纯 Rust 实现，可用官方客户端远程控制 Linux 桌面"
arch=('x86_64')
url="https://github.com/VallierDev/uu-remote-linux"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=('gtk3' 'ffmpeg' 'libpulse' 'pam' 'systemd')
optdepends=(
    'wl-clipboard: Wayland clipboard sync'
    'libpipewire: Wayland portal screen capture'
    'nvidia-utils: NVENC hardware encoding on NVIDIA GPUs'
)
provides=('uu-remote')
conflicts=('uu-remote')
source_x86_64=("uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz::https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('7e3ce5a6cdd72bf678e5ebe324e1b633b9487fe281c13a202d56ff4207886e66')

package() {
    local _dir="uu-remote-linux-v${pkgver}-x86_64-linux"

    install -Dm755 "${srcdir}/${_dir}/uuremote-server" "${pkgdir}/usr/bin/uuremote-server"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
