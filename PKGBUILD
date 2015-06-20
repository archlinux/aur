# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>

pkgname=chromedriver
pkgver=2.15
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
    md5sums=('844c200a4d8e79ad68d76ed68f67aadd')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('21c22803a1fd903ba15ea21ee81de317')
fi

source=("http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
