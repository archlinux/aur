# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=omwcmd
pkgver=0.2.0
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
sha512sums=('bc2b69979aed5047b498bfdbd8a061b284a37d77ec39f76ece6bdeb1121b8848cb2b7a3e8549dbe541b51bf079a76709fce2324993d012a3c4167e38f5b97260')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
