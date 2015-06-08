# Maintainer: Giorgio Wicklein <giowckln@gmail.com>
pkgname=jforex-dukascopy-europe-demo
pkgver=3.0
pkgrel=2
pkgdesc="jForex demo trading client for Dukascopy Europe"
arch=('any')
url="http://www.dukascopy.com/europe/english/forex/trading_login/marketplace_demo_login/"
license=('unknown')
depends=('java-environment' 'xdg-utils')
source=("https://eu-demo.dukascopy.com/fo/platform/jForex"
        "jforex.tar.gz")
md5sums=('SKIP'
         '656364640a6aaca3a34ab3e572efe626')

build() {
  mv jForex jForex.jnlp
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/share/"
  cp -R "$srcdir/jforex/usr/share/" "${pkgdir}/usr/"
  install -Dm644 "$srcdir/jForex.jnlp" "${pkgdir}/usr/share/jforex-dukascopy-europe-demo/"
}
