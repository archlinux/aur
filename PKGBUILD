#Maintainer: Mickael Guillerm <mickael.grm@gmail.com>
pkgname=shellforge
pkgdesc='Terminal tool for generating reverse shells for CTF challenges and educational purposes. Easy to use, fast, and safe for practice environments.'
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url=https://github.com/minosariane/Shellforge
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo')
source=("shellforge${pkgver}.tar.gz::https://github.com/minosariane/shellforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/shellforge-$pkgver"
  cargo build -r
}

package() {
  cd "$srcdir/shellforge-$pkgver"
  cargo install --path .
}
