# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=realesrgan-ncnn-vulkan-bin
pkgver=0.2.3.0
pkgrel=1
_release_date=20211212
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration"
arch=("x86_64")
depends=("vulkan-icd-loader" "gcc-libs")
url="https://github.com/xinntao/Real-ESRGAN"
license=("BSD-3")
source=("https://github.com/xinntao/Real-ESRGAN/releases/download/v${pkgver}/realesrgan-ncnn-vulkan-${_release_date}-ubuntu.zip")
sha256sums=("9e4b78aa0d7796bbdab06ac50f7a424329920a4ea039655465aeed4cbff4a945")

package() {
    cd $srcdir
    install -Dm755 "realesrgan-ncnn-vulkan" "$pkgdir/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan"
    for i in models/*; do
        install -Dm644 $i "$pkgdir/usr/share/realesrgan-ncnn-vulkan/$i"
    done
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/usr/share/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan" "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
}
