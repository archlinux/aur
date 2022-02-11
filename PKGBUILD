# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=permfix
pkgver=0.2.1
pkgrel=1
pkgdesc="Fix permissions.sqlite db to allow cookies for specified domains in Firefox."
arch=("x86_64")
url="https://gitlab.com/stanzabird/permfix"
license=("MPL2")
depends=("sqlite")
source=("https://gitlab.com/stanzabird/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=("2467214a77cccc5e862a3dbfae3ea60b96bd8fac4b1b43af8c2ed1f97f1e672e")

build() {
  cd $pkgname-v$pkgver
  autoreconf -if
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR=$pkgdir/ install
}
