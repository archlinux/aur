# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=cadcraft-private-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 AutoCAD 替代（CAD 制图），上游 storytold/cadcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/cadcraft'
license=('MIT' 'Apache')
provides=("cadcraft=$pkgver")
conflicts=('cadcraft' 'cadcraft-bin' 'cadcraft-git' 'ai.storyteller.cadcraft')
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
source=("https://github.com/storytold/cadcraft/releases/download/v${pkgver}/cadcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('856959a0bbd6f589a68a6c4a17d8f7dde2984f2f443b363519fb388da10ab0ea')

package() {
  bsdtar -xf "$srcdir/cadcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
