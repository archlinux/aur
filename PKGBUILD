# Maintainer: eltonff <https://github.com/eltonfabricio10/>
_pkgname=freeshow
pkgname=${_pkgname}-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="FreeShow is a free and open-source, user-friendly presenter software."
arch=("x86_64")
url="https://github.com/ChurchApps/FreeShow"
license=("GNU Lesser General Public License v3.0")
provides=("$_pkgname")
conflicts=("$_pkgname" "freeshow-git")
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
sha256sums_x86_64=('1960bdaf1cccf744c1da280def2b554465bd9dabec2e4d096bfe56ae266d27ca')

install=${pkgname}.install

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
