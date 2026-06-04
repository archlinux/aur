# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplevoice-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Simplevoice — fast speech-to-text transcription (Tauri)"
arch=('x86_64')
url="https://github.com/MaciejKolerski/simplevoice"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1'
         'alsa-lib' 'vulkan-icd-loader')
optdepends=('vulkan-radeon: akceleracja GPU (AMD)'
            'vulkan-intel: akceleracja GPU (Intel)'
            'nvidia-utils: akceleracja GPU (NVIDIA)')
provides=('simplevoice')
conflicts=('simplevoice')
options=('!strip' '!debug')
install=simplevoice-bin.install
# Tauri names the .deb as {productName}_{version}_amd64.deb.
source_x86_64=("Simplevoice_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Simplevoice_${pkgver}_amd64.deb")
sha256sums_x86_64=('a763d78637941e517e6cc55d95eca29463ece872d58cb5072d9e5acd2481145f')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
