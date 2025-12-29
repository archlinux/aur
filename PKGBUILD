# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=1.0p8
pkgrel=1
pkgdesc="Orbitiny Desktop Environment"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname%-bin}"
license=(GPL-2.0-only)
depends=(
  acl
  at-spi2-core
  cairo
  dbus
  dconf
  file
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  krb5
  libcap
  libglvnd
  libpulse
  libsigc++
  libsndfile
  libsoxr
  libstatgrab
  libtool
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxkbcommon
  libxkbcommon-x11
  libxrender
  orc
  pango
  sh
  systemd-libs
  tdb
  qt5-base
  qt5-charts
  qt5-declarative
  qt5-svg
  qt5-wayland
  qt5-x11extras
  wayland
  xcb-util
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=("${pkgname%-desktop-bin}-$pkgver.tar.gz::$url/files/${pkgname/-desktop/}-release.tar.gz/download")
noextract=("${pkgname%-desktop-bin}-$pkgver.tar.gz")
b2sums=('13a5e80c6760c1009c1415f9f37920326b80cc0c56f2596291617f159bf9d42bc5b886271847d9e93a9ba87d451071b32eb14f5ed6d9e11e411e78b7937e0d87')

package() {
  install -vd "$pkgdir"/opt/${pkgname%-desktop-bin}
  tar -xzf ${pkgname%-desktop-bin}-$pkgver.tar.gz \
    --no-same-owner \
    --strip-components=2 \
    -C "$pkgdir"/opt/${pkgname%-desktop-bin}

  # Fix permissions
  chmod -R go-w "$pkgdir"
  chmod -R go+r "$pkgdir"
  find "$pkgdir"/opt/${pkgname%-desktop-bin} -type d -exec chmod go+x {} \;
}
