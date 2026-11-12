# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=wordcraft-private-bin
pkgver=0.18.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Microsoft Word 替代（纯 Rust 字处理器），上游 storytold/wordcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/wordcraft'
license=('MIT' 'Apache')
provides=("wordcraft=$pkgver")
conflicts=('wordcraft' 'wordcraft-bin' 'wordcraft-git' 'ai.storyteller.wordcraft')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=('alsa-lib: sound support'
            'pipewire-alsa: audio playback and recording via PipeWire'
            'pulseaudio: audio playback and recording via PulseAudio'
            'wayland: native Wayland display support'
            'libx11: X11 and XWayland display support'
            'libxcursor: X11 cursor handling'
            'libxi: X11 input handling'
            'libxrandr: X11 display resolution handling'
            'libglvnd: GPU rendering through EGL'
            'mesa: GPU rendering through EGL'
            'vulkan-driver: GPU rendering through Vulkan'
            'xdg-desktop-portal: native desktop integration and file dialogs'
            'cups: printing support')
source=("https://gh-proxy.com/https://github.com/storytold/wordcraft/releases/download/v${pkgver}/wordcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('5b1b2851bdebf75a23f2ce2efdbda2b2b542749b9fe653f9b7b16dc209dcbb64')

package() {
  bsdtar -xf "$srcdir/wordcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
