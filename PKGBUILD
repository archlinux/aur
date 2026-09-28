# Maintainer: Andrey Kashlak <me@andreymal.org>
# Contributor: icefox <hd@revive-it.ru>

pkgname=aspia-client-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.19
pkgrel=1
pkgdesc="Remote desktop control and file transfer tool (client, official binary)"
url="https://aspia.org/"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
  dbus
  glibc
  hicolor-icon-theme
  libgcc
  libstdc++
  ttf-font
)
provides=(aspia-client)
conflicts=(aspia-client)
options=(!debug !strip)
source_x86_64=("https://github.com/dchapyshev/aspia/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('7339f77e2fc5459234fad7a7f3943de212db7dec3872529e5dee28ba433137d1')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
