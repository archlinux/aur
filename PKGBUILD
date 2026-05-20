pkgname=rsclip-wl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland clipboard manager with GTK UI and background daemon'
arch=('x86_64')
url='https://github.com/jR4dh3y/rsclip-wl'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
)
optdepends=(
  'tesseract: OCR support'
  'wl-clipboard: wl-copy and wl-paste integration'
  'wtype: auto-paste into the focused window'
)
provides=('rsclip-wl')
conflicts=('clipvault' 'clipvault-bin' 'rsclip-wl')
source=(
  "${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/clipvault-${pkgver}-x86_64.tar.zst"
)
sha256sums=('fed8563714223dae08eafdad11b0b528a03208b72d83b01c884f0a61b877c135')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/clipvault-${pkgver}-x86_64/usr" "${pkgdir}/"
}
