# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=sm63redux-bin
_pkgname=sm63redux
pkgver=0.1.6
pkgrel=1
pkgdesc="A full remake of the original Super Mario 63 by Runouw."
arch=("x86_64")
url="https://sm63redux.com/"
license=('MPL-2.0')
provides=("sm63redux")
depends=()
source=(
  "sm63redux.desktop" 
  "icon.png::https://raw.githubusercontent.com/GTcreyon/SM63Redux/master/icon.png" 
  "$_pkgname-$pkgver.zip::https://github.com/GTcreyon/SM63Redux/releases/download/v$pkgver/SM63_Redux_Linux_v$pkgver.zip"
)

sha256sums=(
  "d1eb34345136beae1980e048fd7e9fa66bdaa2323275809a701033b700da32e7"
  "c5a7245cf4ad6594f4aa6ca0b855d439be6945c35f43f8853300af85cfc70d58"
  "206ef7baf3078ae4572a685c60e844f757f31d7a6faf44979a5c08846c43758f"
)

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -r "$srcdir/linux/Super Mario 63 Redux.x86_64" "$pkgdir/opt/$_pkgname/sm63redux"
  cp -r "$srcdir/linux/Super Mario 63 Redux.pck" "$pkgdir/opt/$_pkgname/sm63redux.pck"
  cp "$srcdir/sm63redux.desktop" "$pkgdir/usr/share/applications/sm63redux.desktop"
  cp -a "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/sm63redux.png"

  chmod +x "$pkgdir/opt/$_pkgname/sm63redux"
  ln -s "/opt/$_pkgname/sm63redux" "$pkgdir/usr/bin/sm63redux"
}
