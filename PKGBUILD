# Maintainer: bnema <b@bnema.dev>
pkgname=cef-vaapi-bin
pkgver=156.0.30
pkgrel=3
pkgdesc="Chromium Embedded Framework with VAAPI and proprietary codecs enabled (binary distribution)"
arch=('x86_64')
url="https://chromiumembedded.github.io/cef"
license=('BSD-3-Clause')
provides=("cef=$pkgver")
conflicts=('cef')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'fontconfig'
  'glibc'
  'libasound.so=2-64'
  'libatk-1.0.so=0-64'
  'libatk-bridge-2.0.so=0-64'
  'libatspi.so=0-64'
  'libdbus-1.so=3-64'
  'libdrm'
  'libexpat.so=1-64'
  'libffi'
  'libffi.so=8-64'
  'libfontconfig.so=1-64'
  'libgcc_s.so=1-64'
  'libgio-2.0.so=0-64'
  'libglib-2.0.so=0-64'
  'libgobject-2.0.so=0-64'
  'libpulse'
  'libpulse.so=0-64'
  'libudev.so=1-64'
  'libva'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon.so=0-64'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'vulkan-icd-loader'
)
optdepends=(
  'libva-mesa-driver: VAAPI driver for AMD GPUs'
  'intel-media-driver: VAAPI driver for modern Intel GPUs'
  'libva-utils: VAAPI diagnostics such as vainfo'
)
source=("cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/bnema/cef-vaapi/releases/download/cef-vaapi-v${pkgver}-${pkgrel}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('d98fa349b49e5316cd2b180196a3d6879005500d2346b13b8d3333c1ecb2d808')

package() {
  bsdtar -xpf "${srcdir}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}
