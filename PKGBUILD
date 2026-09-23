pkgname=polaris-gamestream-bin
pkgver=1.4.12
pkgrel=1
pkgdesc="Linux-first game streaming host"
arch=('x86_64')
url="https://github.com/papi-ux/polaris"
license=('GPL3')
depends=('avahi' 'bash' 'boost-libs' 'curl' 'grim' 'labwc' 'libayatana-appindicator' 'libboost_filesystem.so=1.92.0-64' 'libboost_locale.so=1.92.0-64' 'libboost_log.so=1.92.0-64' 'libboost_program_options.so=1.92.0-64' 'libboost_thread.so=1.92.0-64' 'libcap' 'libdrm' 'libei' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11' 'libxcb' 'libxfixes' 'libxi' 'libxrandr' 'libxtst' 'mesa' 'miniupnpc' 'numactl' 'openssl' 'opus' 'pipewire' 'python' 'udev' 'vulkan-icd-loader' 'wayland' 'which' 'wlr-randr' 'xorg-xdpyinfo' 'xorg-xwayland')
source=("Polaris-arch-x86_64-1.4.12.pkg.tar.zst::https://github.com/papi-ux/polaris/releases/download/v1.4.12/Polaris-arch-x86_64.pkg.tar.zst")
noextract=("Polaris-arch-x86_64-1.4.12.pkg.tar.zst")
sha256sums=('f90f31513312a3756f0cba016db3291e6c1700a8f736b00630e19efed8335370')
install=polaris-gamestream-bin.install

package() {
  bsdtar -xf "Polaris-arch-x86_64-1.4.12.pkg.tar.zst" -C "$pkgdir"
  # ensure no pacman metadata leaks
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
  find "$pkgdir" -name ".INSTALL" -delete
}
