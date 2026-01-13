pkgname=mclip-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Clipboard sync between Mac and ArchLinux (Wayland/X11 support)"
arch=('x86_64' 'aarch64')
url="https://github.com/thismixer/MultiClip"
license=('MIT')
provides=('mclip')
conflicts=('mclip')

optdepends=(
    'wl-clipboard: For Wayland support (Hyprland, Sway, GNOME)'
    'xclip: For X11 support (i3, XFCE, KDE)'
)

source_x86_64=("${url}/releases/download/v${pkgver}/mclip_linux_amd64.tar.gz")
sha256sums_x86_64=('bfd1758bd00825e15e93568c4d1fa974c778c01519e221af8e046e2a83affd0e')

source_aarch64=("${url}/releases/download/v${pkgver}/mclip_linux_arm64.tar.gz")
sha256sums_aarch64=('e791c2d4e7ea3109a9205e2b667c822b5849d82335cdc9cceca146f69628aa3f')

package() {
  install -Dm755 "${srcdir}/mclip" "${pkgdir}/usr/bin/mclip"
}