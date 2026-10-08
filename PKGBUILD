# Maintainer: burningserenity <burningserenity@novo-ordo.com>

# RozeLynx from the precompiled release tarballs published upstream: the
# same dist/rozelynx-<ver>-<arch>.tar.xz the build script's --tarball stage
# produces, i.e. a complete staged /usr tree built against glibc.

pkgname=rozelynx-bin
pkgver=156.0.1
pkgrel=1
pkgdesc='RozeLynx Web Browser: Firefox fork with LibreWolf privacy patches and per-tab network interface binding (binary release; Wayland-only builds - build rozelynx-git for X11/XWayland)'
arch=(x86_64)
url='https://bytewheel.org/rozelynx'
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  alsa-lib
  aom
  at-spi2-core
  cairo
  dav1d
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  harfbuzz
  'icu>=78.1'
  libdrm
  libepoxy
  libevent
  libjpeg-turbo
  libpulse
  libvpx
  libwebp
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  mesa
  'nspr>=4.39'
  'nss>=3.125'
  pango
  pixman
  zlib
)
optdepends=(
  'libva: VAAPI hardware video decoding'
  'networkmanager: geolocation via nearby Wi-Fi networks (necko-wifi)'
  'vulkan-icd-loader: Vulkan rendering (hwaccel vulkantest)'
)
provides=("rozelynx=${pkgver}")
conflicts=(rozelynx)
install=rozelynx-bin.install
_tag="v${pkgver}"
source=("https://github.com/Bytewheel/RozeLynx/releases/download/${_tag}/rozelynx-${pkgver}-${CARCH}.tar.xz")
sha256sums=('69f9a26c7b86e98e9a3d55f611d2dec24f0d03c0253c8b638957da209d4ad100')

package() {
  # the tarball contains a complete staged usr/ tree
  cp -a "${srcdir}/usr" "${pkgdir}/"
}