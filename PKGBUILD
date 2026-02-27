pkgname=ssmt4-linux
pkgver=0.0.7_beta
pkgrel=1
pkgdesc="SSMT4 - Super Simple Linux Game Tools 4th"
arch=('x86_64')
url='https://github.com/xiaobai01111/SSMT4-Linux'
license=('GPL-3.0-or-later')
provides=('ssmt4')
conflicts=('ssmt4' 'ssmt4-bin' 'ssmt4-git')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'xdg-utils')
optdepends=(
  'xorg-xwayland: XWayland support'
  'wine: Windows game compatibility'
  'winetricks: Wine helper scripts'
  'umu-launcher: umu-run runtime launcher'
  'bubblewrap: sandbox mode (bwrap)'
  'vulkan-tools: Vulkan diagnostics (vulkaninfo)'
  'pciutils: GPU detection (lspci)'
  '7zip: HoYoverse split archive extraction'
  'unzip: Proton archive extraction'
  'git: Data-parameters repository sync'
  'polkit: privileged telemetry host edits (pkexec)'
  'procps-ng: process monitoring (ps/pgrep)'
  'libayatana-appindicator: tray icon support'
)
options=('!debug')

_upstream_ver="${pkgver//_/-}"
source=(
  "ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/xiaobai01111/SSMT4-Linux/releases/download/${_upstream_ver}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=('94b082f47797d1a71c2c20dde878e616586f97c145073e3c9e92de13eed98d37')

package() {
  bsdtar -xpf "${srcdir}/ssmt4-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
}
