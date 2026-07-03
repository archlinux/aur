# Maintainer: patcito
pkgname=prettymux-bin
pkgver=0.2.45
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
sha256sums=('4f94dce1d23658d0c520feb13c2026500f589d03d96b9dbc517d8f698b470d05')
noextract=("${_asset}")

package() {
  bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" usr
}
