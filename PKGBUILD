# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>

pkgname=chromedriver
pkgver=2.16
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
    md5sums=('fffdb4c098adc2ab61b0e0f5b694f27e')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('fa8e1bc6f9ce474582876653604d675e')
fi

source=("http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_${_arch}.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
