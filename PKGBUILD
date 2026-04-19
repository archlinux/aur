# Maintainer: vkSumi <noreply@github.com>
pkgname=vksumi
pkgver=0.0.4
pkgrel=1
pkgdesc='Vulkan layer for runtime color grading on Linux (Adrenalin / Freestyle equivalent)'
arch=('x86_64')
url='https://github.com/reakjra/vkSumi'
license=('MIT')
depends=('vulkan-icd-loader' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'vulkan-headers')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('add905a3108998a5058fc562d911c6417c90083b3a13e52b493981375cdfd5bd')

build() {
    cd vkSumi-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd vkSumi-$pkgver
    meson install -C build --destdir "$pkgdir"
}
