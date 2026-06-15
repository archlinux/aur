# Maintainer: patcito
pkgname=prettymux-bin
pkgver=0.2.43
pkgrel=1
pkgdesc="GPU-accelerated terminal multiplexer (prebuilt binary)"
arch=('x86_64')
url="https://github.com/patcito/prettymux"
license=('GPL-3.0-only')
options=('!debug')
depends=('gtk4' 'libadwaita' 'json-glib')
provides=('prettymux')
conflicts=('prettymux')

_asset="prettymux-${pkgver}-1-x86_64.pkg.tar.zst"
source=("https://github.com/patcito/prettymux/releases/download/v${pkgver}/${_asset}")
sha256sums=('f66e863aa5c2981742dbed8484447b9aef3bb1acc47bbe62002882b70e93b7b2')
noextract=("${_asset}")

package() {
  bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" usr
}
