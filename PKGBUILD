# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.16.0
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('32dd1332d547f18bfb7d295dff957997464df6e62a3fbe97468332e742ceb5bc')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
