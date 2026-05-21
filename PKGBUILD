# Maintainer: reakjra <reakjra@proton.me>
pkgname=vksumi
pkgver=0.0.6
pkgrel=2
pkgdesc='Vulkan layer for runtime color grading on Linux (Adrenalin / Freestyle equivalent)'
arch=('x86_64')
url='https://github.com/reakjra/vkSumi'
license=('MIT')
depends=('vulkan-icd-loader' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'vulkan-headers')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1b8ebdfef994313b4110616c0a9cd5a663dd521fe29c1f1fe50c6190cb727cbf')

build() {
    cd vkSumi-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd vkSumi-$pkgver
    meson install -C build --destdir "$pkgdir"
}
