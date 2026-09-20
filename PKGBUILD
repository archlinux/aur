pkgname=polaris-gamestream-bin
pkgver=1.4.11
pkgrel=1
pkgdesc="Linux-first game streaming host"
arch=('x86_64')
url="https://github.com/papi-ux/polaris"
license=('GPL3')
depends=('avahi' 'bash' 'boost-libs' 'curl' 'grim' 'labwc' 'libayatana-appindicator' 'libboost_filesystem.so=1.92.0-64' 'libboost_locale.so=1.92.0-64' 'libboost_log.so=1.92.0-64' 'libboost_program_options.so=1.92.0-64' 'libboost_thread.so=1.92.0-64' 'libcap' 'libdrm' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11' 'libxcb' 'libxfixes' 'libxi' 'libxrandr' 'libxtst' 'mesa' 'miniupnpc' 'numactl' 'openssl' 'opus' 'pipewire' 'python' 'udev' 'vulkan-icd-loader' 'wayland' 'which' 'wlr-randr' 'xorg-xdpyinfo' 'xorg-xwayland')
source=("Polaris-arch-x86_64-1.4.11.pkg.tar.zst::https://github.com/papi-ux/polaris/releases/download/v1.4.11/Polaris-arch-x86_64.pkg.tar.zst")
noextract=("Polaris-arch-x86_64-1.4.11.pkg.tar.zst")
sha256sums=('8873900d9fc0a945a87ab4fb66059f8854d2a45c6778876dca65cfb71bffc226')
install=polaris-gamestream-bin.install

package() {
  bsdtar -xf "Polaris-arch-x86_64-1.4.11.pkg.tar.zst" -C "$pkgdir"
  # ensure no pacman metadata leaks
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
  find "$pkgdir" -name ".INSTALL" -delete
}
