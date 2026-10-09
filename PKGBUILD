# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-relay-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.31
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
sha256sums_x86_64=('d07a249378449ab14f99b00d9f26b4e5be47b2b0f324af1413553a4a73c12b95')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
