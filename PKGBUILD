# Maintainer: Victor Rodriguez <vicrodh@users.noreply.github.com>
pkgname=chilpa-bin
pkgver=0.1.2
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
sha256sums_x86_64=('d8b32a40faf7fb6b7d099b05df32279bd4643adfd9661d97a2d45c34c141097a')
sha256sums_aarch64=('918cac16fa46d4bb1a3691dca2b555c1a2b436bc37dc09cf0492a62115df28fc')

package() {
  cd "chilpa-${pkgver}"
  install -Dm755 chilpa-qt "${pkgdir}/usr/bin/chilpa-qt"
  install -Dm644 app.chilpa.Chilpa.desktop "${pkgdir}/usr/share/applications/app.chilpa.Chilpa.desktop"
  install -Dm644 icons/hicolor/512x512/apps/app.chilpa.Chilpa.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/app.chilpa.Chilpa.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE licenses/*
}
