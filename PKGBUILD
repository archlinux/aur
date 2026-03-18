#Maintainer: Mickael Guillerm <mickael.grm@gmail.com>
pkgname=Shellforge
pkgdesc='Easy-to-use reverse shell generator'
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url=https://github.com/minosariane/Shellforge
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minosariane/shellforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build -r
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --path .
}
