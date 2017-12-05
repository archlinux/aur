# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.6.1
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
md5sums_i686=("fbe1a14c792fdec8f418709ea559c635")
md5sums_x86_64=("8e273e783134ba729b8c5df3d1dd3789")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv opt "${pkgdir}"
  mv usr "${pkgdir}"
}

