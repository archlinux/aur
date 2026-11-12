# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=vectorcraft-private-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Adobe Illustrator 替代（矢量插画），上游 storytold/vectorcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/vectorcraft'
license=('MIT' 'Apache')
provides=("vectorcraft=$pkgver")
conflicts=('vectorcraft' 'vectorcraft-bin' 'vectorcraft-git' 'ai.storyteller.vectorcraft')
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
source=("https://github.com/storytold/vectorcraft/releases/download/v${pkgver}/vectorcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('c0ca5a646152aa8e79a135dee81b857a0130fbbc53da594223b95accd203824c')

package() {
  bsdtar -xf "$srcdir/vectorcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
