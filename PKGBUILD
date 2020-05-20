# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.17.0
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('bccbc4d80747aea61ecc3ffae17c5a14acbb0e80d485ca654c9d8261ceafe1da')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
