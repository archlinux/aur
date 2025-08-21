# Maintainer: Rin Leaf <tiflew123 at gmail dot com>
pkgname=sftool-gui-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="GUI version of sftool, a download tool for the SiFli family of chips"
arch=('x86_64')
url="https://github.com/OpenSiFli/sftool-gui"
license=('Apache-2.0')
conflicts=('sftool-bin')
depends=(
  'aom'
  'at-spi2-core'
  'brotli'
  'bzip2'
  'cairo'
  'dav1d'
  'dbus'
  'e2fsprogs'
  'enchant'
  'expat'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'glycin'
  'graphite'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'harfbuzz-icu'
  'hidapi'
  'highway'
  'hyphen'
  'icu'
  'json-glib'
  'keyutils'
  'krb5'
  'lcms2'
  'libavif'
  'libcap'
  'libcloudproviders'
  'libdatrie'
  'libdrm'
  'libelf'
  'libepoxy'
  'libevdev'
  'libffi'
  'libgcrypt'
  'libglvnd'
  'libgpg-error'
  'libgudev'
  'libidn2'
  'libjpeg-turbo'
  'libjxl'
  'libmanette'
  'libnghttp2'
  'libpng'
  'libpsl'
  'libseccomp'
  'libsecret'
  'libsoup3'
  'libtasn1'
  'libthai'
  'libunistring'
  'libunwind'
  'libwebp'
  'libx11'
  'libxau'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxdmcp'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxml2'
  'libxrandr'
  'libxrender'
  'libxslt'
  'libyuv'
  'mesa'
  'openssl'
  'orc'
  'pango'
  'pcre2'
  'pixman'
  'rav1e'
  'sqlite'
  'svt-av1'
  'systemd-libs'
  'tinysparql'
  'tpm2-tss'
  'util-linux-libs'
  'wayland'
  'webkit2gtk-4.1'
  'woff2'
  'xz'
  'zlib'
  'zstd'
)
makedepends+=(
	"libarchive"
)
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/v${pkgver}/sftool_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=('7951153ac12b733a4033d0ba1571e7c0266f0380174c11dce9c23433b6e33a1a')

function pkgver() {
  rm -rf control
  mkdir control
	tar -xf control.tar.gz -C ./control
	cat control/control | grep 'Version: ' | cut -c '10-'
}

function package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}

function post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}

function post_upgrade() {
  post_install
}

function post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}
