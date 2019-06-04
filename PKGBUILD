# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: dylan araps <dylan.araps@gmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.52
pkgrel=1
pkgdesc='A GUI tool for working with mobile devices'
arch=('i686' 'x86_64')
url='http://www.cydiaimpactor.com'
license=('unknown')
depends=('fontconfig' 'gtk2' 'libsm' 'libudev0-shim' 'ncurses5-compat-libs')
makedepends=('gendesk')
source=('http://www.cydiaimpactor.com/logo.png')
source_i686=("https://cache.saurik.com/impactor/l32/Impactor32_$pkgver.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/Impactor64_$pkgver.tgz")
sha256sums=('3585f8a8f8b9b5104e1bd5b95f3b3604da33f9659085be310af18d70d6f0a84f')
sha256sums_i686=('135218c123214a419b0a18dcae84ec1eeb47fa90515c509ad68aa6ec1091449f')
sha256sums_x86_64=('23b758162a34c6160021e6f82193df76bfbcc09f9476e492b76b130bb4e9e323')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Cydia Impactor' --exec $_pkgname --categories 'Utility;'
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 $_pkgname "$pkgdir/usr/bin"
  install -m644 $_pkgname.{dat,pem} "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib"
  install -m755 $_pkgname.so "$pkgdir/usr/lib"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
