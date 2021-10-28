# Maintainer: Rokoucha <aur@rokoucha.net>
pkgname=mdmg
_pkgver=0.1.2-alpha.2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A scaffold prototype code tool"
url="https://github.com/himanoa/mdmg"
source=("https://github.com/himanoa/${pkgname}/archive/v${_pkgver}.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
sha256sums=('0efef44157f153e5284e7c2b0f6acd4bdec5eec54ce4048047b166ed2d7818b5')

check() {
  cd "$srcdir/$pkgname-$_pkgver"

  cargo test --release --locked
}

build () {
  cd "$srcdir/$pkgname-$_pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}