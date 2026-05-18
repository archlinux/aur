# Maintainer: reakjra <reakjra@proton.me>
pkgname=vksumi
pkgver=0.0.5
pkgrel=1
pkgdesc='Vulkan layer for runtime color grading on Linux (Adrenalin / Freestyle equivalent)'
arch=('x86_64')
url='https://github.com/reakjra/vkSumi'
license=('MIT')
depends=('vulkan-icd-loader' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'vulkan-headers')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c4187cf68e05223c2cb31b9c606aa7736bb91c0635abc4ad655f1d185b52d720')

build() {
    cd vkSumi-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd vkSumi-$pkgver
    meson install -C build --destdir "$pkgdir"
}
