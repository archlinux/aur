# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=soundcraft-private-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Pro Tools 替代（DAW 音频），上游 storytold/soundcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/soundcraft'
license=('MIT' 'Apache')
provides=("soundcraft=$pkgver")
conflicts=('soundcraft' 'soundcraft-bin' 'soundcraft-git' 'ai.storyteller.soundcraft')
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
source=("https://github.com/storytold/soundcraft/releases/download/v${pkgver}/soundcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('fa629b37c70c03ed89e5e20617a049de725fc28cbb50a7f4cbcd4c3c26a3727d')

package() {
  bsdtar -xf "$srcdir/soundcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
