# Maintainer: Gurov
pkgname=zeptofetch-bin
pkgver=1.8
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/Gur0v/zeptofetch/releases/download/v$pkgver/zeptofetch.tar.zst")
sha256sums=('a52dae831674ca3f15e8b2a7ce719d29585015607dd6639a79fae01024876d58')

package() {
  install -Dm755 zeptofetch "$pkgdir/usr/bin/zeptofetch"
  
  cd "$srcdir"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
