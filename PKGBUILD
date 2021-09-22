# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.1.8
pkgrel=1
pkgdesc='Trustworthy encrypted command line authenticator app compatible with multiple backups.'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('rust' 'libxcb' 'libxkbcommon-x11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d2c66a18db2edd5930c8d0a34ae0fd64fe2888fa3cec134ca59fc590ff650442')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
