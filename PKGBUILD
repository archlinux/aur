# Maintainer: Gurov
pkgname=zeptofetch-bin
pkgver=1.6
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/Gur0v/zeptofetch/releases/download/v$pkgver/zeptofetch.tar.zst")
sha256sums=('bd77ecbe62139dd8bd340e46242d32b04cb33071ad3e2fb96f70d8fc8a5bd81c')

package() {
  install -Dm755 zeptofetch "$pkgdir/usr/bin/zeptofetch"
  
  cd "$srcdir"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
