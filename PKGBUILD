pkgname=libretro-db-tools
pkgver=1.9.0
pkgdesc='A collection of tools for RetroArch database format (RDB) manipulation'
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/libretro/RetroArch/tree/master/libretro-db"
license=('GPL3')
_commit='5e551dd92b79d8127e66939835ea3c2a140c4078'
source=("$pkgname-$pkgver.zip::https://github.com/libretro/RetroArch/archive/${_commit}.zip")
sha256sums=('dd024815c92c8b68ead4268d1590fe49779f259bd1301aa2e17b53d6b1c7bfd0')

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
