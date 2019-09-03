# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=git-brws
pkgver=0.11.2
pkgrel=2
pkgdesc='Command line tool to open repository URLs for GitHub, BitBucket and GitLab in your browser'
arch=('x86_64')
url="https://github.com/rhysd/git-brws"
license=('MIT')
depends=()
conflicts=('git-brws-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d7cb340c7ee2d7573c10a682eb2465179f1f2a549ee3184e3dd1e5a175f2a405')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
