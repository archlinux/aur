# Maintainer: FraV1982 <consulenza dot vangi at outlook dot com>

pkgname=pearson-reader-plus-full-lang
pkgver=4.9
pkgrel=1
pkgdesc="A simple Reader for Pearson digital books."
arch=('x86_64')
url="https://www.pearson.com/"
license=('custom')
depends=('sdl2' 'unzip' 'tar')
optdepends=(
'chromium: a modern browser for the application to work'
'firefox: a modern browser for the application to work'
'google-chrome: a modern browser for the application to work'
'evince: a pdf viewer'
'epdfview: a pdf viewer'
'qpdfview: a pdf viewer'
'mupdf: a pdf viewer'
)
options=("!emptydirs" "!strip")

_debname=B300361C

source=(https://link.pearson.it/B300361C)
sha256sums=('e58754c4bfbc0770a180fb22aaea7cf48466d2277c8558c6ce330d8b7fd81d3e')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.gz > /dev/null

  find ./opt -type d -exec chmod 755 '{}' \;
  find ./usr -type d -exec chmod 755 '{}' \;
}

package() {
  cd "$srcdir"
  cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
}
