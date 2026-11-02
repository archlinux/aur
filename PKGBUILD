# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-relay-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.2
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
sha256sums_x86_64=('106c3cf597393a976376f2675a4d517cd1cd59e6f774f2696f7a8ce0999edee1')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
