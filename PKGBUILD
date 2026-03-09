pkgname=ssmt4-linux
pkgver=0.0.8_beta
pkgrel=1
pkgdesc="SSMT4 - Super Simple Linux Game Tools 4th"
arch=('x86_64')
url='https://github.com/xiaobai14491-afk/SSMT4-Linux'
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'xdg-utils')
optdepends=(
  'xorg-xwayland: XWayland support'
  'wine: Windows game compatibility'
  'winetricks: Wine helper scripts'
  'umu-launcher: umu-run runtime launcher'
  'bubblewrap: sandbox mode (bwrap)'
  'vulkan-tools: Vulkan diagnostics (vulkaninfo)'
  'pciutils: GPU detection (lspci)'
  '7zip: split archive extraction'
  'unzip: Proton archive extraction'
  'git: Data-parameters repository sync'
  'polkit: privileged telemetry host edits (pkexec)'
  'procps-ng: process monitoring (ps/pgrep)'
  'libayatana-appindicator: tray icon support'
  'wayland: Wayland support'
)
provides=('ssmt4-linux')
conflicts=('ssmt4-linux-git')

_upstream_ver="${pkgver//_/-}"
source=(
  "ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/xiaobai14491-afk/SSMT4-Linux/releases/download/${_upstream_ver}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=('98f4845dc589d1f14f1d60567979de04dbaf48a6d9ef25283fadd69a37fee4e2')

package() {
  bsdtar -xpf "${srcdir}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
}
