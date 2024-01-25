# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=realesrgan-ncnn-vulkan-bin
pkgver=0.2.5.0
pkgrel=1
_release_date=20220424
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration"
arch=("x86_64")
depends=("vulkan-icd-loader" "gcc-libs")
provides=('realesrgan-ncnn-vulkan')
conflicts=('realesrgan-ncnn-vulkan')
url="https://github.com/xinntao/Real-ESRGAN-ncnn-vulkan"
license=("BSD-3-Clause")
source=("https://github.com/xinntao/Real-ESRGAN/releases/download/v${pkgver}/realesrgan-ncnn-vulkan-${_release_date}-ubuntu.zip")
sha256sums=("e5aa6eb131234b87c0c51f82b89390f5e3e642b7b70f2b9bbe95b6a285a40c96")

package() {
    cd $srcdir
    install -Dm755 "realesrgan-ncnn-vulkan" "$pkgdir/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan"
    for i in models/*; do
        install -Dm644 $i "$pkgdir/usr/share/realesrgan-ncnn-vulkan/$i"
    done
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan" "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
}
