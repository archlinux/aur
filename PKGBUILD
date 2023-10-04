# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: sant0s <diego.delossantos@mailbox.org>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname="onnxruntime-cuda-bin"
pkgver=1.16.0
pkgrel=1
pkgdesc="Cross-platform, high performance ML inferencing and training accelerator (CUDA execution provider)"
arch=("x86_64")
url="https://www.onnxruntime.ai/"
license=("MIT")
provides=("onnxruntime" "onnxruntime-cuda")
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
b2sums=('3ddfdc7b1611d554c74e2a68443726cdb704a4314a4d11ef3ca275ff9b59905e3c104d9121ba4813dc746adad811cf4a1a53ee77ab94a8025e413e8c7006dcac'
        '99f52bf67792c2f527f48b5004b24b345dd7aad3c50401ab042d9f6f97e638f996258212fa1072813f153973cbecaa0424a35f87c84f956c05cf21d39da42099')
options=("!strip")

package(){
 install -d "$pkgdir/usr/include/onnxruntime"
 install -d "$pkgdir/usr/lib"
 cp -r "onnxruntime-$pkgver/include/onnxruntime"/* "$pkgdir/usr/include/onnxruntime"
 cp -r "$srcdir/onnxruntime-linux-x64-gpu-$pkgver/include"/* "$pkgdir/usr/include/onnxruntime"
 cp "$srcdir/onnxruntime-linux-x64-gpu-$pkgver/lib"/* "$pkgdir/usr/lib/"
 install -D -m 644 "onnxruntime-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/onnxruntime/LICENSE"
}
