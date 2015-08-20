# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>

pkgname=chromedriver
pkgver=2.18
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
depends=('libpng' 'gconf')
optdepends=('google-chrome')
conflicts=('chromium')

if [ "$CARCH" = "i686" ]; then
    _arch='linux32'
    md5sums=('0ac230f5f19c72cebf3042970217ad01')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('709e2dd132ac6c2a09de084fdc19db45')
fi

source=("http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
