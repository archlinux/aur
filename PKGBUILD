# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>

pkgname=sfk-bin
pkgver=1.9.7.0
pkgrel=1
pkgdesc="Swiss File Knife - a command line tools collection"
arch=('x86_64')
url='http://stahlworks.com/dev/swiss-file-knife.html'
license=('BSD')
depends=('gcc-libs')
provides=('sfk')
conflicts=('sfk')
_bin='sfk197-linux-64.exe'
source=("$_bin::https://sourceforge.net/projects/swissfileknife/files/1-swissfileknife/$pkgver/$_bin/download")
noextract=("$_bin")
md5sums=('84972c34612a4afc5ba4b45e366b5c95')

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
