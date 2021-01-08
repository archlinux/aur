# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.1.3
pkgrel=1
pkgdesc='Trustworthy encrypted command line authenticator app compatible with multiple backups.'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e00cd3f3cbfe6c232abaae5ef1856bfa6f618b534231f91b7128cedb9b027caa')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
