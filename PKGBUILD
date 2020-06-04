# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=omwcmd
pkgver=0.2.1
pkgrel=1
pkgdesc="A command line tool for interacting with openmw plugins"
provides=('omwcmd')
conflicts=('omwcmd')
arch=(any)
url="https://gitlab.com/portmod/omwcmd"
license=(GPL3)
depends=()
makedepends=("rust")
source=("https://gitlab.com/portmod/omwcmd/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('92c40e23cec83b7f4979182c46483732807bffdcc306089c0319d9f9acdf597bdc081d427c887354844d1525af72a4d68bd00c7c076e379e61075a01cb34dd70')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
