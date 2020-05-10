pkgname=libretro-db-tools
pkgver=1.8.6
pkgdesc='A collection of tools for RetroArch database format (RDB) manipulation'
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/libretro/RetroArch/tree/master/libretro-db"
license=('GPL3')
_commit='36802f713312dc16c93a7765cd4a1b0883db5a61'
source=("$pkgname-$pkgver.zip::https://github.com/libretro/RetroArch/archive/${_commit}.zip")
sha256sums=('1e0c9f4644ba37ed23964b39a61a9519cd155c14ee45fef2f80a652628e74050')

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
