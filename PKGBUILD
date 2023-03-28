# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>
# Contributor: AnActualEmerald <emerald@mecha.garden>

pkgname=papa
pkgver=2.2.0
pkgrel=2
pkgdesc="Mod manager CLI for Northstar"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
makedepends=('cargo' 'openssl' 'pkgconf')
optdepends=('sccache: compiler caching for faster compiling')
provides=($pkgname)
conflicts=($pkgname)
_commit=ecb6306027e12007da86541fbdac145fa69bc2d4
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
}
