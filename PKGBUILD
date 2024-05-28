# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>
pkgname=slcl
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple and lightweight cloud"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/slcl"
license=('AGPL3')
depends=('openssl' 'cjson' 'dynstr' 'libweb')
optdepends=('jq: usergen script')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('52a15f96958becf975a16e29b68f5ddb97e1fed81899e9b988ec127b4841ff590a0a12c7cad793bc90ce971b8894690d14bdb82ff5be1af200052efe02fb0f46')

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

