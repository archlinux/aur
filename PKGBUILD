# Maintainer: Alexeyev Vitaly
pkgname=synthos-bin
epoch=1
pkgver=0.2.322
pkgrel=1
pkgdesc='Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — native synaptix engine on any NVIDIA sm_80+ GPU, .syn and GGUF models'
arch=('x86_64')
url='https://github.com/VitaminDB/synthos'
license=('GPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'vulkan-icd-loader' 'libxkbcommon' 'wayland' 'gtk3' 'libavutil.so=61-64' 'libavcodec.so=63-64' 'libavformat.so=63-64' 'libswscale.so=10-64' 'libswresample.so=7-64')
optdepends=('nvidia-utils: нейросети на видеокарте NVIDIA (драйвер CUDA грузится в рантайме)' 'cuda: компилятор ядер NVRTC — ядра собираются на лету под карту (sm_80+)' 'openvino-intel-npu-plugin: нейросети на Intel NPU' 'intel-npu-driver: драйвер Intel NPU' 'intel-npu-compiler: компилятор моделей для Intel NPU' 'synaptix: системная служба synaptixd — synthos делит с ней загруженные модели; без неё работает встроенный движок' 'synshell-ai: ассистент synshell — ставит службу synaptix, с которой synthos делит модели')
provides=(synthos)
conflicts=(synthos synthos-git)
options=('!strip' '!debug')
source_x86_64=("https://github.com/VitaminDB/synthos/releases/download/v$pkgver/synthos-$pkgver-x86_64.tar.zst")
sha256sums_x86_64=('4e5291eeacfe62b461da0a8a3583d7d1b15835eb0f1a242f4cbb1ccb3027aba6')

package() {
    cd "$srcdir"
    cp -a --no-preserve=ownership usr "$pkgdir"/
}
