pkgname=pinentry-rofi
pkgver=1.0
pkgrel=1
pkgdesc=" Pinentry rofi-based bare implementation"
arch=('any')
url="https://gist.github.com/759cbf956bea20d382a6128c641d2746.git"
license=('')
depends=('ruby')
source=("git+https://gist.github.com/759cbf956bea20d382a6128c641d2746.git"
        "rofi.patch")
md5sums=('SKIP'
         '4a4a8dd65f39aef30be31a278051971c')

build() {
  cd "$srcdir/759cbf956bea20d382a6128c641d2746"
  git apply ../rofi.patch
}

package() {
  install -Dm777 "$srcdir/759cbf956bea20d382a6128c641d2746/pinentry-rofi.rb"  "$pkgdir/usr/bin/pinentry-rofi"
}
