# Maintainer: reakjra <reakjra@proton.me>
pkgname=vksumi
pkgver=0.1.0
pkgrel=1
pkgdesc='Vulkan layer for runtime color grading on Linux (Adrenalin / Freestyle equivalent)'
arch=('x86_64')
url='https://github.com/reakjra/vkSumi'
license=('MIT')
depends=('vulkan-icd-loader' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'vulkan-headers')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f05b96b52a81b115d490a1959ffdcf7e3125be5d364139efa147c9802c5095ae')

build() {
    cd vkSumi-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd vkSumi-$pkgver
    meson install -C build --destdir "$pkgdir"
}
