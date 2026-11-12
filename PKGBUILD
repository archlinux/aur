# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=filmcraft-private-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Adobe Premiere Pro 替代（视频编辑），上游 storytold/filmcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/filmcraft'
license=('MIT' 'Apache')
provides=("filmcraft=$pkgver")
conflicts=('filmcraft' 'filmcraft-bin' 'filmcraft-git' 'ai.storyteller.filmcraft')
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
source=("https://github.com/storytold/filmcraft/releases/download/v${pkgver}/filmcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('bbdee1fe9e8671094e4e548d3920a808b7c7411a802d743b19158753d951d722')

package() {
  bsdtar -xf "$srcdir/filmcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
