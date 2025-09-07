# Maintainer: eltonff <https://github.com/eltonfabricio10/>
_pkgname=freeshow
pkgname=${_pkgname}-lts
pkgver=1.4.9
pkgrel=1
pkgdesc="Show song lyrics and more for free!"
arch=("x86_64")
url="https://github.com/ChurchApps/FreeShow"
license=("GNU Lesser General Public License v3.0")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=("gtk3"
         "libnotify"
         "nss"
         "libxss"
         "libxtst"
         "xdg-utils"
         "at-spi2-core"
         "util-linux-libs"
         "libsecret")
optdepends=("libappindicator-gtk3")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-${pkgver}-amd64.deb")
sha256sums_x86_64=('d9e5de445ce83fbdaf5e5f179b2b4ff51080764ec9e40fb61b5cc0ff6dd01aed')

install=${pkgname}.install

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
