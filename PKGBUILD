# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-router-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.20
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
sha256sums_x86_64=('5b737e2434d7e172cc52bc2a9093689243c43da6d3d53eab0ddfd5ba66a9784c')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
