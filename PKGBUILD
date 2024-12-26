# Maintainer: 128bitds <*hidden*>
pkgname=nsisbi-ext
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract files from NSIS installers created with the NSISBI format (i.e. can not be extracted with 7zip)."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/kmod-midori/unity-nsisbi-ext"
license=('MIT')
depends=()
makedepends=('git' 'rust')
source=("${pkgname}-git::git+https://github.com/kmod-midori/unity-nsisbi-ext.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-git"
  cargo build --bins -r
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-git/target/release/nsisbi-ext" "$pkgdir/usr/bin/"
}
