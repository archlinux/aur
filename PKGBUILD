# Maintainer: Victor Rodriguez <vicrodh@users.noreply.github.com>
pkgname=chilpa-bin
pkgver=0.1.0
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
sha256sums_x86_64=('0902e505a88292711549e79c080c03aec3dfae101feddc8b00c8e1bbcb152b4f')
sha256sums_aarch64=('85385b52188668912a17bcfa2d13ea71abeef4fe486fe180dc08ab12a867d701')

package() {
  cd "chilpa-${pkgver}"
  install -Dm755 chilpa-qt "${pkgdir}/usr/bin/chilpa-qt"
  install -Dm644 app.chilpa.Chilpa.desktop "${pkgdir}/usr/share/applications/app.chilpa.Chilpa.desktop"
  install -Dm644 icons/hicolor/512x512/apps/app.chilpa.Chilpa.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/app.chilpa.Chilpa.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE licenses/*
}
