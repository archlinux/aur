pkgname=kaleidoswap
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://kaleidoswap.com/"
license=('MIT')
depends=('rust' 'nodejs') # AppImages need this
# source=("https://github.com/kaleidoswap/desktop-app/releases/download/app-v$pkgver/$pkgname_$pkgver_amd64.AppImage")
source=("https://github.com/kaleidoswap/desktop-app/releases/download/app-v0.1.0/KaleidoSwap_0.1.0_amd64.AppImage")
sha256sums=('SKIP')  # Replace SKIP with the real checksum for best practice

package() {
  install -Dm755 "$srcdir/KaleidoSwap_0.1.0_amd64.AppImage" "$pkgdir/opt/$pkgname/KaleidoSwap.AppImage"
  
  # Symlink for easier access
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/KaleidoSwap.AppImage" "$pkgdir/usr/bin/kaleidoswap"
}

