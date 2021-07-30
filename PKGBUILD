# Maintainer: HOuadhour <HOuadhour@pm.me>
pkgname=brave-browser
pkgver=1.27.109
pkgrel=1
pkgdesc="Brave Stable version based on the official rpm package"
arch=(x86_64)
url="https://brave.com/linux/"
license=('MPL2')
depends=(
  'alsa-lib'
  'gtk3'
  'libxss'
  'nss'
  'ttf-font'
  'libnotify'
)
optdepends=(
  'libgnome-keyring: Enable GNOME keyring support'
  'cups: Printer support'
)

source=("https://github.com/brave/brave-browser/releases/download/v$pkgver/brave-browser-$pkgver-$pkgrel.x86_64.rpm")
sha256sums=("8ba5c8eca039a9d3a403d11db0b898cc4df2c33f8d4bde5e96ecaa38a5b068ee")
validpgpkeys=('6481A7A3E66A3AA39D0DD7302A60AB408C14BF70')

prepare() {
  rm -rf "$srcdir/etc"
}

package() {
  cp -a "$srcdir/opt" "$pkgdir/opt"
  cp -a "$srcdir/usr" "$pkgdir/usr"
}
