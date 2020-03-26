# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.3.0
pkgrel=2
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('a2588955935f36cbf5d60dc717b99c64')
sha1sums=('ef5f617890c69c5075947ffb6ab4de05a9234b20')
sha512sums=('71674df00c9b361164eeb9114807d63f895c451a0381c5e61fbdab860784ef78ddf1b961e4de6ffe45677cc70b9b9c971a79d156d50dff254be1d005a107231f')

build() {
  cd "$pkgname-$pkgver"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
