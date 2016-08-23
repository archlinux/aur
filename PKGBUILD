# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin

pkgname=chromedriver
pkgver=2.23
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
    md5sums=('45df7fb52f4cba39a5bdcdaf2c16e171')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('cc89692d75fb0bdfe700ec0ca19808a5')
fi

source=("${pkgname}_${pkgver}_${_arch}.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
