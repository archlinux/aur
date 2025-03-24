# Maintainer: mo_ mo_harchegani@tutamail.com
pkgname=kaleidoswap
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://kaleidoswap.com/"
license=('MIT')
depends=()
source=("https://github.com/kaleidoswap/desktop-app/releases/download/app-v0.1.0/KaleidoSwap_0.1.0_amd64.AppImage")
sha256sums=('SKIP')

prepare() {
	chmod +x "KaleidoSwap_${pkgver}_amd64.AppImage"
	"./KaleidoSwap_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
  # install -Dm755 "$srcdir/KaleidoSwap_0.1.0_amd64.AppImage" "$pkgdir/opt/$pkgname/KaleidoSwap.AppImage"
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/squashfs-root/"* "$pkgdir/opt/$pkgname/"
  
  # Symlink for easier access
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/AppRun" "$pkgdir/usr/bin/kaleidoswap"
}
