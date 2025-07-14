# Maintainer: b1ek <me@blek.codes>

pkgname=pam-duress
pkgver=2.0.0
pkgrel=1
pkgdesc="PAM module for duress user password"
url="https://github.com/nuvious/pam-duress"
arch=(any)
license=("LGPL-3.0")
depends=()
makedepends=(gcc make openssl)
source=("https://github.com/nuvious/pam-duress/archive/04e607f9ab674c8dbbf27ea8bb59158178a72f69.zip")
sha256sums=("504fb984af3fa469cb7d0a59af456be483e9514d69f8e7bb64010e98db406de6")

build() {
  mv "$(find . -mindepth 1 -maxdepth 1 -type d)" "$pkgname"
  cd $pkgname
  make
}

package() {
  cd $pkgname
  BIN_INSTALL=$pkgdir/usr/local/bin
  PAM_DIR=$pkgdir/usr/local/lib/pam
  mkdir -p $BIN_INSTALL
  mkdir -p $PAM_DIR

  make install BIN_INSTALL=$BIN_INSTALL PAM_DIR=$PAM_DIR
}

