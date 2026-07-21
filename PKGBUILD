# Maintainer: Kozika <kozikakkozika+aur at gmail dot com>

pkgname=luma-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='Official Frida GUI for interactive dynamic instrumentation (prebuilt binary)'
arch=('x86_64')
url='https://luma.frida.re/'
license=('MIT')
depends=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'graphene'
  'graphite'
  'gtk4'
  'harfbuzz'
  'json-glib'
  'libadwaita'
  'libepoxy'
  'libnice'
  'librsvg'
  'libsoup3'
  'libzip'
  'pango'
  'sqlite'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'zlib'
)
provides=('luma')
conflicts=('luma')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/frida/luma/releases/download/${pkgver}/luma-${pkgver}-ubuntu-26.04-x86_64.deb")
sha256sums=('8e5c44320080e256093abefd40c33ce6c4e74416e16dc826204ace5c2aacd86a')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.zst
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
}
