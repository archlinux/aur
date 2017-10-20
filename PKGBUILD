# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.8.6
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/mattgreen/watchexec'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4caa882a17d3e826dca92af157382145c599ac204e9b9ea810dc309402a200e8')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
