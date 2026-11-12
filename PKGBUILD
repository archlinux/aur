# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=gridcraft-private-bin
pkgver=0.19.1
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Microsoft Excel 替代（电子表格），上游 storytold/gridcraft'
arch=('x86_64')
url='https://getartcraft.com/apps/gridcraft'
license=('MIT' 'Apache')
provides=("gridcraft=$pkgver")
conflicts=('gridcraft' 'gridcraft-bin' 'gridcraft-git' 'ai.storyteller.gridcraft')
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
source=("https://gh-proxy.com/https://github.com/storytold/gridcraft/releases/download/v${pkgver}/gridcraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('ab8f44806b81e79ead6d408bf8f9f63bb896330380ec30a71b70359edcf66d44')

package() {
  bsdtar -xf "$srcdir/gridcraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
