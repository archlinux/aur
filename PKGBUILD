# Maintainer: FraV1982 <consulenza dot vangi at outlook dot com>

pkgname=quick-n-easy-web-builder-10
pkgver=10.1.1
pkgrel=1
pkgdesc="A WYSIWYG web builder for creating amazing websites."
arch=('x86_64')
url="https://www.quickandeasywebbuilder.com/"
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

_debname=quick-n-easy-web-builder-10_10.1.1_amd64.deb

source=(https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-10_10.1.1_amd64.deb)
md5sums=('SKIP')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.zst > /dev/null

  find ./opt -type d -exec chmod 755 '{}' \;
  find ./usr -type d -exec chmod 755 '{}' \;

  msg2 "LITTLE ADVERTISEMENT: this program is free for ONLY 60 DAYS, then it require a license."
}

package() {
  cd "$srcdir"
  cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
}
