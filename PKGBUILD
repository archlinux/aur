# Maintainer: Giorgio Wicklein <giowckln@gmail.com>
pkgname=jforex-dukascopy-europe-live
pkgver=3.0
pkgrel=2
pkgdesc="jForex live trading client for Dukascopy Europe"
arch=('any')
url="http://www.dukascopy.com/europe/english/forex/trading_login/live/"
license=('unknown')
depends=('java-environment' 'xdg-utils')
source=("https://eu-live.dukascopy.com/fo/platform/jForex"
        "jforex.tar.gz")
md5sums=('SKIP'
         '13f96662a0d09b9f821aea72dbb52612')

build() {
  mv jForex jForex.jnlp
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/share/"
  cp -R "$srcdir/jforex/usr/share/" "${pkgdir}/usr/"
  install -Dm644 "$srcdir/jForex.jnlp" "${pkgdir}/usr/share/jforex-dukascopy-europe-live/"
}
