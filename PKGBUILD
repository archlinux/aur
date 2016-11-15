# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-series
pkgver=0.9.0
pkgrel=1
pkgdesc="Git extension that tracks changes to a patch series over time"
arch=('i686' 'x86_64')
url="http://github.com/git-series/git-series"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo')
optdepends=()
source=("https://github.com/git-series/git-series/archive/${pkgver}.tar.gz")
sha256sums=('d70c9a2105c69fdd6059c04285ddb74b3b10852d9729dd8a14681b9bf36790be')

build() {
  cd "$srcdir/git-series-${pkgver}"
  export CARGO_HOME="$srcdir"
  cargo build --release
}

package() {
  cd "$srcdir/git-series-${pkgver}"
  install -m755 -D "target/release/git-series" "$pkgdir/usr/bin/git-series"
  install -D "git-series.1" "$pkgdir/usr/man/man1/git-series.1"
}

# vim:set ts=2 sw=2 et:
