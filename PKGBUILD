# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin

pkgname=chromedriver
pkgver=2.30
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
    md5sums=('ea9eab8df2c5eff60dff7cfee4c7b5f5')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('122a978861d06bd10049609a92018b89')
fi

source=("${pkgname}_${pkgver}_${_arch}.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
