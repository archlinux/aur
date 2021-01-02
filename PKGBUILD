# Maintainer: replydev <replydev@protonmail.com>
# Maintainer: replydev <commoncargo@protonmail.com>

pkgname=cotp
pkgver=0.1.0
pkgrel=1
pkgdesc='Trustworthy command line authenticator app compatible with backups from andOTP, Aegis and so on..'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2d9261eb857595acb1315ea386c29ed983f938f45959dcf0f83d0cbe176ff457')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
