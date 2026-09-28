# Maintainer: Andrey Kashlak <me@andreymal.org>
# Contributor: icefox <hd@revive-it.ru>

pkgname=aspia-client-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.20
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
sha256sums_x86_64=('e0bbaccf3ec45614bd564dfa9d235636b6964cc29035b058ca8a8e4814f5e3d5')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
