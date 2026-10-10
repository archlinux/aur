# Maintainer: Andrey Kashlak <me@andreymal.org>
# Contributor: icefox <hd@revive-it.ru>

pkgname=aspia-client-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.32
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
sha256sums_x86_64=('de07102da1a55d5fcbbad14f1a0c2de630b2c5ad445f58fa132bba4f84db55a6')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"
}
