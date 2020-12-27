# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.0.8
pkgrel=1
pkgdesc='Trustworthy command line authenticator app compatible with backups from andOTP, Aegis and so on..'
arch=('x86_64' 'aarch64' 'armv7')
url='https://codeberg.org/replydev/cotp'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce7510bee35994b37cb29669b983a8f5eaebbc72ebe202f003179c5891393361')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
