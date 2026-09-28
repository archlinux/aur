# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-relay-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.19
pkgrel=1
pkgdesc="Remote desktop control and file transfer tool (relay, official binary)"
url="https://aspia.org/"
arch=(x86_64)
license=(GPL-3.0-only)
install=aspia-relay.install
depends=(
  dbus
  glibc
  libgcc
  libstdc++
)
provides=(aspia-relay)
conflicts=(aspia-relay)
options=(!debug !strip)
source_x86_64=("https://github.com/dchapyshev/aspia/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('24d4fa771491f3bed1d3fd17146cde7f975c6b79cd6ac6b0ab5f91c2ff26fd2f')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
