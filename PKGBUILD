# Maintainer: reakjra <reakjra@proton.me>
pkgname=vksumi
pkgver=0.0.6
pkgrel=1
pkgdesc='Vulkan layer for runtime color grading on Linux (Adrenalin / Freestyle equivalent)'
arch=('x86_64')
url='https://github.com/reakjra/vkSumi'
license=('MIT')
depends=('vulkan-icd-loader' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'vulkan-headers')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b4e9b2ea30fe369525f6b7d34369282f06777ea522d1790db9df03ac80fa9028')

build() {
    cd vkSumi-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd vkSumi-$pkgver
    meson install -C build --destdir "$pkgdir"
}
