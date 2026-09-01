# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=helios-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Game stream host for Selene and Moonlight OS (prebuilt)'
arch=('x86_64')
url='https://github.com/moonlight-os/helios'
license=('GPL-3.0-only')
install=helios.install

depends=(
  'avahi' 'boost-libs' 'curl' 'gcc-libs' 'libayatana-appindicator' 'libcap'
  'libdrm' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11'
  'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'miniupnpc' 'msquic' 'numactl'
  'open-iscsi' 'openssl' 'opus' 'systemd-libs' 'udev' 'usbip' 'wayland' 'which'
)
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'sway: Isolated virtual displays on Linux hosts without an existing Sway session'
)
provides=('helios')
conflicts=('helios' 'helios-git')

source=("helios-${pkgver}-1-${CARCH}.pkg.tar.zst::https://github.com/moonlight-os/helios/releases/download/v0.6.1/helios-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('3a7cbcf4eef8230aa210da381962838104e7ac2199b1266737aec3ecdbc8271d')

package() {
  cp -a usr "$pkgdir/"
}
