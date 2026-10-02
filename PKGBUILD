# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-router-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.22
pkgrel=1
pkgdesc="Remote desktop control and file transfer tool (router, official binary)"
url="https://aspia.org/"
arch=(x86_64)
license=(GPL-3.0-only)
install=aspia-router.install
depends=(
  dbus
  glibc
  libgcc
  libstdc++
)
provides=(aspia-router)
conflicts=(aspia-router)
options=(!debug !strip)
source_x86_64=("https://github.com/dchapyshev/aspia/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('3fb798fb112f28cf599a4866b1c68c15ea12b52fa161f3925288db1ecdea35fc')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
