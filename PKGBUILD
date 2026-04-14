# Maintainer: patcito
pkgname=prettymux-bin
pkgver=0.2.28
pkgrel=1
pkgdesc="GPU-accelerated terminal multiplexer (prebuilt binary)"
arch=('x86_64')
url="https://github.com/patcito/prettymux"
license=('GPL-3.0-only')
options=('!debug')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'json-glib')
provides=('prettymux')
conflicts=('prettymux')

_asset="prettymux-${pkgver}-1-x86_64.pkg.tar.zst"
source=("https://github.com/patcito/prettymux/releases/download/v${pkgver}/${_asset}")
sha256sums=('8f4fd46a6b1d58a8efd9680c2c514759adf655a04e351381c02f01a26a9ad1c5')
noextract=("${_asset}")

package() {
  bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" usr
}
