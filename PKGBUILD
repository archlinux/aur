pkgname=git-flow-tui
pkgver=1.2.11
pkgrel=1
pkgdesc='Terminal UI for gitflow with extended logic for CI/CD'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-2')
provides=('gitflow')
depends=(
  'git'
  'glibc'
  'libgcc'
)
makedepends=(
  'rust'
)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)
install=$pkgname.install

build() {
  cd "$srcdir/${pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}"
  
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}