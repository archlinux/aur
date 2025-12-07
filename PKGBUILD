# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger
pkgver=2.1.1
pkgrel=4
pkgdesc="A Rust/Tauri GTK3 application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('GPL3')
provides=('textmerger')
conflicts=('textmerger')

options=('!debug' '!strip')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'libappindicator-gtk3'
)

source=(
  "textmerger-2.1.1-1-x86_64.pkg.tar.zst::https://github.com/pierspad/textmerger/releases/download/v$pkgver/textmerger-$pkgver-1-x86_64.pkg.tar.zst"
)
sha256sums=('3575bd3e99a80de33fba7872431288940185b471e851ff4551007bc68346e2ca')

package() {
  cd "$srcdir"
  
  if [ -d "usr" ]; then
    cp -a usr "$pkgdir/"
  else
    echo "Error: /usr directory not found in extracted source"
    exit 1
  fi
}
