# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：仅信任官方 GitHub release 资产，sha256 锁定官方 SHA256SUMS.txt。
pkgname=photocraft-private-bin
pkgver=0.23.0
pkgrel=1
pkgdesc='自用维护：开源 clean-room 版 Adobe Photoshop 替代（图像编辑），上游 storytold/photocraft'
arch=('x86_64')
url='https://getartcraft.com/apps/photocraft'
license=('MIT' 'Apache')
provides=("photocraft=$pkgver")
conflicts=('photocraft' 'photocraft-bin' 'photocraft-git' 'ai.storyteller.photocraft')
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
source=("https://gh-proxy.com/https://github.com/storytold/photocraft/releases/download/v${pkgver}/photocraft-${pkgver}-linux-x86_64.pkg.tar.zst")
sha256sums=('74179d3d3ce9098b0cfe10f09a05144a9ae1f226fdb3777e0624351124ed846d')

package() {
  bsdtar -xf "$srcdir/photocraft-$pkgver-linux-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}
