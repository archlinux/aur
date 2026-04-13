# Maintainer: patcito
pkgname=prettymux-bin
pkgver=0.2.18
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
sha256sums=('f4c7a509fae54be7aec9f4f66312b348094e471557a3b551e30c15457f2f1f25')
noextract=("${_asset}")

package() {
  bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" usr
}
