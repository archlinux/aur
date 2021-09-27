# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=realesrgan-ncnn-vulkan-bin
pkgver=0.2.2.4
pkgrel=1
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration"
arch=("x86_64")
depends=("vulkan-icd-loader" "gcc-libs")
url="https://github.com/xinntao/Real-ESRGAN"
license=("BSD-3")
source=("https://github.com/xinntao/Real-ESRGAN/releases/download/v${pkgver}/realesrgan-ncnn-vulkan-20210901-ubuntu.zip")
sha256sums=("cad3fd31328faaec148da128915dde60dc3cf9c3cc56b72e0ee19d3904baf322")

package() {
    cd $srcdir
    install -Dm755 "realesrgan-ncnn-vulkan" "$pkgdir/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan"
    for i in models/*; do
        install -Dm644 $i "$pkgdir/usr/share/realesrgan-ncnn-vulkan/$i"
    done
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan" "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
}
