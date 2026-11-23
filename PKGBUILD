# Maintainer: Kozika <kozikakkozika+aur at gmail dot com>

pkgname=luma-bin
pkgver=2.1.1
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
provides=('luma')
conflicts=('luma')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/frida/luma/releases/download/${pkgver}/luma-${pkgver}-ubuntu-26.04-x86_64.deb")
sha256sums=('25126ebe31d255fe863cd594fc80065f4a0092be67d189366038eb9533cbd7e2')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.zst
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
}
