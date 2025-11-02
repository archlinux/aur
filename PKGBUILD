# Maintainer: Gurov
pkgname=zeptofetch-bin
pkgver=1.5
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/Gur0v/zeptofetch/releases/download/v$pkgver/zeptofetch.tar.zst")
sha256sums=('8a84f27a12566c0fca69855dc8ba6a88d9c3309313f4344a3152a90553319a25')

package() {
  install -Dm755 zeptofetch "$pkgdir/usr/bin/zeptofetch"
  
  cd "$srcdir"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
