# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.1.1
pkgrel=1
pkgdesc='Trustworthy command line authenticator app compatible with backups from andOTP, Aegis and so on..'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fb80f7437c7132797468d16d9c7940e6ba434ffc3126d620e573a406c2b64970')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
