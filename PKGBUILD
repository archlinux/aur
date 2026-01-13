# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=lacy
pkgver=v0.6.0
pkgrel=1
pkgdesc="Fast magical cd alternative for lacy terminal navigators"
arch=(any)
url="https://github.com/timothebot/lacy"
license=('MIT')
makedepends=(git cargo)
source=("git+$url#tag=$pkgver")
install='lacy.install'
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build -r --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
