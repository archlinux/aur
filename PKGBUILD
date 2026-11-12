# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=designcraft-private-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Adobe InDesign 替代（排版出版），上游 storytold/designcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/designcraft'
license=('MIT' 'Apache')
provides=("designcraft=$pkgver")
conflicts=('designcraft' 'designcraft-bin' 'designcraft-git' 'ai.storyteller.designcraft')
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
source=("https://github.com/storytold/designcraft/releases/download/v${pkgver}/designcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('50744692323feb1805ffe2bab1dc30af3d5d958e88b94cc9f36959bbb46fac67')

package() {
  bsdtar -xf "$srcdir/designcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
