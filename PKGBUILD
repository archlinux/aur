# Maintainer: Florijan Hamzic <fh[at]infinicode.de>

pkgname=gnome-shell-extension-stocks
pkgver=3
pkgrel=1
pkgdesc="Gnome shell extension for displaying stock quotes in panel"
arch=(any)
url="https://github.com/cinatic/stocks-extension"
license=('GPL')
depends=('gnome-shell>=3.18')
install=gnome-shell.install
source=("https://github.com/cinatic/stocks-extension/archive/v${pkgver}_${pkgrel}.tar.gz")
sha256sums=('7d9a112827ccd187fdd12b0282518f5d2f2bd82bc0a60a84b51ee741b05cbe53')

build() {
	cd "$srcdir/stocks-extension-${pkgver}_${pkgrel}"	
	make
}

package() {
  cd "$srcdir/stocks-extension-${pkgver}_${pkgrel}"
	make DESTDIR="$pkgdir/" install
}
