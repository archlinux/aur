# Maintainer: Gurov
pkgname=zeptofetch-bin
pkgver=1.4
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/Gur0v/zeptofetch/releases/download/v$pkgver/zeptofetch.tar.zst")
sha256sums=('f73cfbd063e1725488fbf559902c916b17f2df6753f84d206bfa774def35535e')

package() {
  install -Dm755 zeptofetch "$pkgdir/usr/bin/zeptofetch"
  
  cd "$srcdir"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
