# Maintainer: eltonff <https://github.com/eltonfabricio10/>
_pkgname=freeshow
pkgname=${_pkgname}-bin
pkgver=1.6.0
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
sha256sums_x86_64=('e866ba83aa9e4fc5996378641398a7f9668de231569e7e55436eace74e1644fd')

install=${pkgname}.install

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
