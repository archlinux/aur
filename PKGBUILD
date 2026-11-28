# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwalld-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="LianWall daemon - built-in Vulkan image/video wallpaper engine"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('glibc>=2.39' 'libplacebo.so=387-64' 'libavformat.so=63-64' 'libavcodec.so=63-64' 'libavutil.so=61-64' 'libswscale.so=10-64' 'vulkan-icd-loader' 'vulkan-driver' 'wayland' 'lcms2')
optdepends=('awww>=0.12.1: optional external image backend'
            'mpvpaper>=1.9: optional external video backend'
            'nvidia-utils: NVIDIA VRAM monitoring'
            'rocm-smi-lib: AMD VRAM monitoring')
provides=("lianwalld=$pkgver")
conflicts=('lianwalld')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwalld_${pkgver}_linux_x86_64")
sha256sums=('d8041f17af358b17ee749d939d7d0b351aa409399300c8b395a66ec0f6d6cf13')

package() {
    install -Dm755 "lianwalld_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwalld"
}
