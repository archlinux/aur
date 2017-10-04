# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("i686" "x86_64")
url="https://keeweb.info"
license=("GPL")
depends=("gconf" "libxss")
optdepends=("gnome-shell-extension-dash-to-dock")
provides=("keeweb-desktop")
conflicts=("keeweb-desktop", "keeweb", "keeweb-bin", "keeweb-git")
source_i686+=("$pkgname::https://github.com/keeweb/keeweb/releases/download/v$pkgver/KeeWeb-$pkgver.linux.ia32.deb")
source_x86_64+=("$pkgname::https://github.com/keeweb/keeweb/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
md5sums_i686=("67f877e85e3b1e04f54de0134a8fc39f")
md5sums_x86_64=("b64c2e4e1096800e41ef38d21fadf4b2")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv opt "${pkgdir}"
  mv usr "${pkgdir}"
}

