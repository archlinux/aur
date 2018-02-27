# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.6.3
pkgrel=2
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("i686" "x86_64")
url="https://keeweb.info"
license=("MIT")
depends=("gconf" "libxss")
provides=("keeweb-desktop")
conflicts=("keeweb-desktop" "keeweb" "keeweb-bin" "keeweb-git")
source_i686+=("$pkgname::https://github.com/keeweb/keeweb/releases/download/v$pkgver/KeeWeb-$pkgver.linux.ia32.deb")
source_x86_64+=("$pkgname::https://github.com/keeweb/keeweb/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
md5sums_i686=("3a835ecfd23145cecd8cd01201afa8db")
md5sums_x86_64=("2d3bd08a027b27ae5d49e9a68ddd203f")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv opt "${pkgdir}"
  mv usr "${pkgdir}"
}
