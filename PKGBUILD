# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synaptix-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synaptix neural-network service: language models, speech, images and video for all apps — on NVIDIA GPU, Intel NPU or CPU'
depends=('gcc-libs')
optdepends=('nvidia-utils: NVIDIA driver (NVENC, neural networks on the GPU)'
            'cuda: NVRTC kernel compiler for NVIDIA GPUs'
            'openvino-intel-npu-plugin: neural networks on Intel NPU (Core Ultra)'
            'intel-npu-driver: Intel NPU driver'
            'intel-npu-compiler: Intel NPU graph compiler')
provides=('synaptix')
conflicts=('synaptix' 'synaptix-git')
backup=('etc/synaptix/synaptixd.toml')
options=('!strip' '!debug')
noextract=('synaptix-0.2.0-x86_64.tar.zst' 'synaptix-0.2.0-aarch64.tar.zst')
source_x86_64=("synaptix-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synaptix-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('02540f5eed30b7286345baad116e52784eff66e9c8a6f74ae77b313838834a66')
source_aarch64=("synaptix-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synaptix-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('c18138276346f0e3fdfb9a7a6e526833a175f6efb556f56f47c9237947c14abd')

package() {
    bsdtar -xpf "$srcdir/synaptix-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
