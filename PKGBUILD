pkgname=polaris-gamestream-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Linux-first game streaming host"
arch=('x86_64')
url="https://github.com/papi-ux/polaris"
license=('GPL3')
depends=('avahi' 'bash' 'boost-libs' 'curl' 'grim' 'labwc' 'libayatana-appindicator' 'libboost_filesystem.so=1.92.0-64' 'libboost_locale.so=1.92.0-64' 'libboost_log.so=1.92.0-64' 'libboost_program_options.so=1.92.0-64' 'libboost_thread.so=1.92.0-64' 'libcap' 'libdrm' 'libei' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11' 'libxcb' 'libxfixes' 'libxi' 'libxrandr' 'libxtst' 'mesa' 'miniupnpc' 'numactl' 'openssl' 'opus' 'pipewire' 'python' 'udev' 'vulkan-icd-loader' 'wayland' 'which' 'wlr-randr' 'xorg-xdpyinfo' 'xorg-xwayland')
source=("Polaris-arch-x86_64-1.5.0.pkg.tar.zst::https://github.com/papi-ux/polaris/releases/download/v1.5.0/Polaris-arch-x86_64.pkg.tar.zst")
noextract=("Polaris-arch-x86_64-1.5.0.pkg.tar.zst")
sha256sums=('9bbac1660eba3b06f373d2695ed15d6252f55297fb6c48a8f3fd6cc9f4125f0a')
install=polaris-gamestream-bin.install

package() {
  bsdtar -xf "Polaris-arch-x86_64-1.5.0.pkg.tar.zst" -C "$pkgdir"
  # ensure no pacman metadata leaks
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
  find "$pkgdir" -name ".INSTALL" -delete
}
