# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: dylan araps <dylan.araps@gmail.com>
# Contributor: mitts <mittens2001@opmbx.org>
pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.51
pkgrel=1
pkgdesc="A GUI tool for working with mobile devices"
arch=('i686' 'x86_64')
url="http://www.cydiaimpactor.com"
license=('unknown')
depends=('fontconfig' 'gtk2' 'libsm' 'libudev0-shim' 'ncurses5-compat-libs')
makedepends=('gendesk')
source=("http://www.cydiaimpactor.com/logo.png")
source_i686=("https://cache.saurik.com/impactor/l32/Impactor32_${pkgver}.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/Impactor64_${pkgver}.tgz")
sha512sums=('2274b559d0cd0f0c1dbff7f3b85ec12bb6485a225c23071d8367c932d8f7972b9daa9400debac81e19cd1ecaff942ef9d391f74f337652834e41d5a1c0235072')
sha512sums_i686=('6aa4ce10473394d9eded6dc036bf4e2503147ddb2df1ca0cc07ec4aab26046637697f848122ebe4eedb92f0b087a6f94edc1a855a162bb354150dc6fb2bc1ac0')
sha512sums_x86_64=('f440467914d3972536581dcef4bd45092e30afbf72a83dd1f2eb52ced9b5c04d63f18f48c4ca162e345079ac06cafa987a19b32e2f6cc3e0d7776ad82ac93d46')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Cydia Impactor' --exec $_pkgname --categories 'Utility;'
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 $_pkgname "$pkgdir/usr/bin/"
  install -m644 $_pkgname.{dat,pem} "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib"
  install -m755 $_pkgname.so "$pkgdir/usr/lib/"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
