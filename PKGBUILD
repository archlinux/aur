# Maintainer: Florian Märkl <tree-sitter-aur@florianmaerkl.de>
pkgname=tree-sitter-cli-bin
pkgver=0.15.11
pkgrel=1
pkgdesc="An incremental parsing system for programming tools"
arch=(x86_64)
url="https://tree-sitter.github.io/tree-sitter/"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/tree-sitter/tree-sitter/releases/download/$pkgver/tree-sitter-linux-x64.gz"
		"https://raw.githubusercontent.com/tree-sitter/tree-sitter/$pkgver/LICENSE")
noextract=(tree-sitter-linux-x64.gz
		   LICENSE)
md5sums=('7e09d23c07e841652f1ffd1c61ee4c3b'
         'b83e3e9ab94483903b3bc21d9a1d41ed')

prepare() {
  gunzip -c tree-sitter-linux-x64.gz > tree-sitter
  chmod +x tree-sitter
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp tree-sitter "$pkgdir/usr/bin/tree-sitter"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
