# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=figcraft-private-bin
pkgver=0.18.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Figma 替代（界面设计），上游 storytold/figcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/figcraft'
license=('MIT' 'Apache')
provides=("figcraft=$pkgver")
conflicts=('figcraft' 'figcraft-bin' 'figcraft-git' 'ai.storyteller.figcraft')
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
source=("https://github.com/storytold/figcraft/releases/download/v${pkgver}/figcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('d2b37692cd25f883dac9eb363ae319dd9de350f8e4640e7c219348d0f8eca2cf')

package() {
  bsdtar -xf "$srcdir/figcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
