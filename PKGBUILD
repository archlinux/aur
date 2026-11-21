# Maintainer: bnema <b@bnema.dev>
pkgname=cef-vaapi-bin
pkgver=156.0.30
pkgrel=1
pkgdesc="Chromium Embedded Framework with VAAPI and proprietary codecs enabled (binary distribution)"
arch=('x86_64')
url="https://chromiumembedded.github.io/cef"
license=('BSD-3-Clause')
provides=("cef=$pkgver")
conflicts=('cef')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dav1d'
  'dbus'
  'libdrm'
  'libffi'
  'libpulse'
  'libva'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
  'openh264'
  'pango'
  'vulkan-icd-loader'
)
optdepends=(
  'libva-mesa-driver: VAAPI driver for AMD GPUs'
  'intel-media-driver: VAAPI driver for modern Intel GPUs'
  'libva-utils: VAAPI diagnostics such as vainfo'
)
source=("cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/bnema/cef-vaapi/releases/download/cef-vaapi-v${pkgver}-${pkgrel}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('1d9caf1863387adf852041ba7d7d26e074d804dacbcc26953761bc0a5b4eee60')

package() {
  bsdtar -xpf "${srcdir}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}
