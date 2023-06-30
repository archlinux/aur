# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: sant0s <diego.delossantos@mailbox.org>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname="onnxruntime-cuda-bin"
pkgver=1.15.1
pkgrel=1
pkgdesc="Cross-platform, high performance ML inferencing and training accelerator (CUDA execution provider)"
arch=("x86_64")
url="https://www.onnxruntime.ai/"
license=("MIT")
provides=("onnxruntime")
conflicts=("onnxruntime"
           "onnxruntime-bin"
           "onnxruntime-cuda"
           "onnxruntime-git")
depends=("cudnn"
         "nccl"
         "openmpi"
         "nsync"
         "abseil-cpp")
source=("https://github.com/microsoft/onnxruntime/releases/download/v$pkgver/onnxruntime-linux-x64-gpu-$pkgver.tgz"
        "onnxruntime.zip::https://github.com/microsoft/onnxruntime/archive/refs/tags/v${pkgver}.zip")
sha256sums=('eab891393025edd5818d1aa26a42860e5739fcc49e3ca3f876110ec8736fe7f1'
            '55a3dcb9dc959a007e8d043509a9dc0b5dbccdfe9e7f8a5ea75f7add0a71e733')
options=("!strip")

package(){
 install -d "$pkgdir/usr/include/onnxruntime"
 install -d "$pkgdir/usr/lib"
 cp -r "onnxruntime-$pkgver/include/onnxruntime"/* "$pkgdir/usr/include/onnxruntime"
 cp -r "$srcdir/onnxruntime-linux-x64-gpu-$pkgver/include"/* "$pkgdir/usr/include/onnxruntime"
 cp "$srcdir/onnxruntime-linux-x64-gpu-$pkgver/lib"/* "$pkgdir/usr/lib/"
 install -D -m 644 "onnxruntime-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/onnxruntime/LICENSE"
}
