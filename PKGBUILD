# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=eureqa-api
pkgver=1.08.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="API for detecting equations and hidden mathematical relationships in your data"
arch=('i686' 'x86_64')
url="http://code.google.com/p/eureqa-api/"
license=('custom')
depends=('boost-libs' 'openssl')
source=("http://eureqa-api.googlecode.com/files/eureqa_api_${_pkgver}.zip")
md5sums=('ef6bd82e5569c52efb04a3f1123d0a3c')

package() {
  cd "$srcdir/eureqa_api_${_pkgver}"
  mkdir -p "$pkgdir/usr/include/eureqa"
  install -Dm644 eureqa/* "$pkgdir/usr/include/eureqa/"

  if [ $CARCH = "i686" ]; then
    install -Dm755 server/linux32/formulize_server "$pkgdir/usr/bin/formulize_server"
  elif [$CARCH == "x86_64"]; then
    install -Dm755 server/linux32/formulize_server "$pkgdir/usr/bin/formulize_server"
  fi
}
