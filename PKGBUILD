# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin

pkgname=chromedriver
pkgver=2.25
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome')

if [ "$CARCH" = "i686" ]; then
    _arch='linux32'
    md5sums=('175ac6d5a9d7579b612809434020fd3c')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('16673c4a4262d0f4c01836b5b3b2b110')
fi

source=("${pkgname}_${pkgver}_${_arch}.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
