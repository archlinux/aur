# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin

pkgname=chromedriver
pkgver=2.19
pkgrel=4
pkgdesc="Standalone server which implements WebDriver's wire protocol"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
depends=('libpng' 'gconf')
optdepends=('google-chrome' 'chromium')

if [ "$CARCH" = "i686" ]; then
    _arch='linux32'
    md5sums=('b1e881182574cd2354c00c384d0949cc')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('9e476aa088baab9bed9c1a5e7007c9c3')
fi

source=("${pkgname}_${pkgver}_${_arch}.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
