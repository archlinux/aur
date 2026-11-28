# Maintainer: yang208115 <a3305587173@outlook.com>

pkgname=kabegame-bin
pkgver=4.7.0
pkgrel=1
pkgdesc="Plugin-driven anime media collector, gallery, and wallpaper manager"
arch=('x86_64')
url="https://github.com/kabegame/kabegame"
license=('GPL-3.0-only')
provides=('kabegame')
conflicts=('kabegame')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libcups'
  'libdrm'
  'libpipewire'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'openssl-3'
  'pango'
  'shared-mime-info'
  'systemd-libs'
  'zlib'
)
optdepends=(
  'libva-nvidia-driver: VA-API hardware video decoding on NVIDIA GPUs'
  'pipewire: PipeWire desktop wallpaper streaming and audio spectrum'
  'plasma-desktop: KDE Plasma 6 wallpaper plugin mode'
  'gnome-shell: GNOME Shell wallpaper plugin mode'
)
options=('!strip' '!debug')
install="${pkgname}.install"
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/kabegame/kabegame/releases/download/v${pkgver}/Linux-Kabegame-standard_${pkgver}_amd64.deb")
sha256sums_x86_64=('b41176ad279303ef82be1c2c705566fcf1fc04a8db881ffad7715603c7030f96')

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/kabegame" "${pkgdir}/usr/lib/kabegame/kabegame-cef-helper"
}
