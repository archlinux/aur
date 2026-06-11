# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="zml-smi-bin"
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal diagnostic and monitoring tool for GPUs, TPUs and NPUs"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/zml/zml"
license=(Apache-2.0)
depends=(glibc libstdc++ libgcc)
provides=(zml-smi)
conflicts=(zml-smi)

source_x86_64=("https://mirror.zml.ai/zml-smi/v$pkgver/zml-smi-v$pkgver-linux-amd64.tar.zst")
sha256sums_x86_64=("4314878a87053ebc26062b0f856e96702958ea9172c8850094b12a1236be9877")

source_aarch64=("https://mirror.zml.ai/zml-smi/v$pkgver/zml-smi-v$pkgver-linux-arm64.tar.zst")
sha256sums_aarch64=("ace50ffae340839ddd277202cc81da8292ca19eed721494dbf4534508cb157f0")

package () {
    mkdir -p "$pkgdir/usr/share"
    mkdir -p "$pkgdir/usr/bin"
    cp -r zml-smi "$pkgdir/usr/share"
    ln -s /usr/share/zml-smi/zml-smi "$pkgdir/usr/bin/zml-smi"
}
