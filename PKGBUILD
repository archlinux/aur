# Maintainer: Victor Rodriguez <vicrodh@users.noreply.github.com>
pkgname=chilpa-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Native music player with local libraries and extensible sources'
arch=('x86_64' 'aarch64')
url='https://chilpa.app'
license=('MIT' 'Apache-2.0' 'BSD-2-Clause' 'ISC' 'OFL-1.1')
depends=(
  'alsa-lib'
  'bubblewrap'
  'dbus'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libpipewire'
  'libpulse'
  'libstdc++'
  'openssl'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-wayland'
  'sqlite'
)
provides=('chilpa')
conflicts=('chilpa')
options=('!strip' '!debug')
source_x86_64=("https://github.com/vicrodh/chilpa/releases/download/v${pkgver}/chilpa-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/vicrodh/chilpa/releases/download/v${pkgver}/chilpa-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('b8e717149caf9a4f96752a3992229936ceebadf5332e312fb45a251c9a2810da')
sha256sums_aarch64=('25aa3b2a8d13adef24b7a0affb37769c45a16ae8a38d69bf59a729b38b5898b5')

package() {
  cd "chilpa-${pkgver}"
  install -Dm755 chilpa-qt "${pkgdir}/usr/bin/chilpa-qt"
  install -Dm644 app.chilpa.Chilpa.desktop "${pkgdir}/usr/share/applications/app.chilpa.Chilpa.desktop"
  install -Dm644 icons/hicolor/512x512/apps/app.chilpa.Chilpa.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/app.chilpa.Chilpa.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE licenses/*
}
