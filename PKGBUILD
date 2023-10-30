# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=slcl
pkgver=0.1.0
pkgrel=2
pkgdesc="A simple and lightweight cloud"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/slcl"
license=('AGPL3')
depends=('openssl' 'cjson' 'dynstr' 'libweb')
optdepends=('jq: usergen script')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b9a43aa2efcfa20ed2c251d309142fb89fecde9470f9f02bcb205cbc141e1d5f29b7b1429c38386913cf2c4b20364baf17108f025efe49fe190ca582f1724e11')

prepare() {
  cd "$pkgname"

  ./configure --prefix=/usr
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  sudo make install
}

