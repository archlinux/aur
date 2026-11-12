# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=lightcraft-private-bin
pkgver=0.21.0
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Adobe Lightroom 替代（照片管理与 raw），上游 storytold/lightcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/lightcraft'
license=('MIT' 'Apache')
provides=("lightcraft=$pkgver")
conflicts=('lightcraft' 'lightcraft-bin' 'lightcraft-git' 'ai.storyteller.lightcraft')
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
source=("https://gh-proxy.com/https://github.com/storytold/lightcraft/releases/download/v${pkgver}/lightcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('8a953bf0bbfc9dfcc405358aa462909494bf8aca5848ac56e8c36d9a6b258d7c')

package() {
  bsdtar -xf "$srcdir/lightcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
