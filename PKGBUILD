pkgname=libretro-db-tools
pkgver=1.15.0
pkgdesc='A collection of tools for RetroArch database format (RDB) manipulation'
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/libretro/RetroArch/tree/master/libretro-db"
license=('GPL3')
_commit='6616b807edea5b56683e9fbca8b003b436c22b13'
source=("$pkgname-$pkgver.zip::https://github.com/libretro/RetroArch/archive/${_commit}.zip")
sha256sums=('fc49f259ba285e5fdd3f896d2a68366578e253a467ed06eec79ad238774af853')

build() {
  cd "${srcdir}/RetroArch-${_commit}/libretro-db"
  make
}

package() {
  cd "${srcdir}/RetroArch-${_commit}/libretro-db"

  install -m 755 -d "${pkgdir}/usr/bin/"
  install -m 755 libretrodb_tool "${pkgdir}/usr/bin/lrdbtool"
  install -m 755 c_converter "${pkgdir}/usr/bin/lrdbconv"
}
