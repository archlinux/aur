# Maintainer: patcito
pkgname=prettymux-bin
pkgver=0.2.36
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
sha256sums=('3bebb8002ee1e539ced3464435774ce7d9a7038d16c27d3ce7311421ea6f965c')
noextract=("${_asset}")

package() {
  bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" usr
}
