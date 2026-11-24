# Maintainer: Kozika <kozikakkozika+aur at gmail dot com>

pkgname=luma-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='Official Frida GUI for interactive dynamic instrumentation (prebuilt binary)'
arch=('x86_64')
url='https://luma.frida.re/'
license=('MIT')
depends=(
  'at-spi2-core'
  'cairo'
  'curl'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'graphite'
  'gtk4'
  'gtksourceview5'
  'harfbuzz'
  'json-glib'
  'libadwaita'
  'libelf'
  'libepoxy'
  'libffi'
  'libgee'
  'libnghttp2'
  'libnice'
  'librsvg'
  'libsoup3'
  'libunwind'
  'libx11'
  'libzip'
  'openssl-3'
  'pango'
  'qemu-img'
  'qemu-system-aarch64'
  'qemu-system-arm'
  'qemu-system-x86'
  'sqlite'
  'util-linux-libs'
  'vulkan-icd-loader'
  'xz'
  'zlib'
)
optdepends=(
  'alsa-lib: ALSA audio backend'
  'jack: JACK audio backend'
  'libpulse: PulseAudio audio backend'
)
provides=('luma')
conflicts=('luma')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/frida/luma/releases/download/${pkgver}/luma-${pkgver}-ubuntu-26.04-x86_64.deb")
sha256sums=('014d99f8a4dcfe458c1e66aa57bd9e629b38f739e1d9de6a3e85c0e42d68210f')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.zst
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
}
