# Maintainer: Gustavo Martins <gustarmartins at users dot noreply dot github dot com>

pkgname=mornye-bin
_pkgname=mornye
pkgver=5.4.5
pkgrel=1
pkgdesc='Desktop music player and library manager built with Flutter and Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/mornyeapp/Mornye'
license=('LGPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'json-glib'
  'libepoxy'
  'libsecret'
  'mpv'
  'pango'
  'wayland'
)
optdepends=(
  'gst-plugins-base: additional GStreamer audio codecs'
  'gst-plugins-good: additional GStreamer audio codecs'
  'xdg-desktop-portal: native folder picker dialogs'
  'xdg-utils: open external links and folders'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("https://github.com/mornyeapp/Mornye-Desktop/releases/download/v${pkgver}/Mornye-v${pkgver}-linux-amd64.deb")
source_aarch64=("https://github.com/mornyeapp/Mornye-Desktop/releases/download/v${pkgver}/Mornye-v${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('da097cc588201f282bb27a138c207761e23c275eaa2f144a6cff4622287a52b2')
sha256sums_aarch64=('6e44d8be236c336357894b47d0f7e59ac24939a98a596b3a153268a4b06aa1af')

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
