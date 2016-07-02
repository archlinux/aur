# Maintainer: Loïc Damien <loic.damien at dzamlo dot ch>
pkgname=treeify
pkgver=0.1.3
pkgrel=1
pkgdesc="converts the output of a command that lists files into a tree representation similar to \
         the output of the command tree"
arch=('i686' 'x86_64')
url="https://github.com/dzamlo/treeify"
license=('MIT' 'Apache')
depends=(gcc-libs)
makedepends=(cargo)
source=("https://github.com/dzamlo/treeify/archive/treeify-0.1.3.tar.gz")
sha256sums=('55e27fc14e40c76c61e5eeb01e5bce1720e15f4ed489056d27ce81e2b3440a21')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "target/release/build/$pkgname-"*"/out/${pkgname}_bash.sh" \
      "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
