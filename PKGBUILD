# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>

pkgname=sfk-bin
pkgver=2.0.0.2
pkgrel=1
pkgdesc="Swiss File Knife - a command line tools collection"
arch=('x86_64')
url='http://stahlworks.com/dev/swiss-file-knife.html'
license=('BSD')
depends=('gcc-libs')
provides=('sfk')
conflicts=('sfk')
_bin='sfk200-linux-64.exe'
source=("$_bin::https://sourceforge.net/projects/swissfileknife/files/1-swissfileknife/$pkgver/$_bin/download")
noextract=("$_bin")
md5sums=('3e7b1f2b481a44c69aadbccad7782bb0')

prepare() {
  cp "$_bin" "$srcdir/sfk"
  chmod  +x  "$srcdir/sfk"
}

package() {
  install -DT "$srcdir/sfk" "$pkgdir/usr/bin/sfk"
  install -dm755            "$pkgdir/usr/share/licenses/sfk"
     "$srcdir/sfk" license >"$pkgdir/usr/share/licenses/sfk/LICENSE" || true
  rm "$srcdir/sfk"
}
