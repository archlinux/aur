# Maintainer: bnema <b@bnema.dev>
pkgname=cef-vaapi-bin
pkgver=154.0.34
pkgrel=4
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
  'pango'
  'vulkan-icd-loader'
)
optdepends=(
  'libva-mesa-driver: VAAPI driver for AMD GPUs'
  'intel-media-driver: VAAPI driver for modern Intel GPUs'
  'libva-utils: VAAPI diagnostics such as vainfo'
)
source=("cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/bnema/cef-vaapi/releases/download/cef-vaapi-v${pkgver}-${pkgrel}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('63a3d92bad66d165d046fc9d0d9cfd7c49da8299610e7118cac5b60ba948c4d8')

package() {
  bsdtar -xpf "${srcdir}/cef-vaapi-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}
