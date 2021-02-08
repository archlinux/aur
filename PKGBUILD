# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.1.6
pkgrel=1
pkgdesc='Trustworthy encrypted command line authenticator app compatible with multiple backups.'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5afa6ad273c0e415e58e75ff154697fba218531d7ea2f26bb7fc1f0a721e0fed')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
