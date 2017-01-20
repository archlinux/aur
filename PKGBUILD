# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-series
pkgver=0.9.1
pkgrel=1
pkgdesc="Git extension that tracks changes to a patch series over time"
arch=('i686' 'x86_64')
url="http://github.com/git-series/git-series"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo' 'cmake')
optdepends=()
source=("https://github.com/git-series/git-series/archive/${pkgver}.tar.gz")
sha256sums=('c0362e19d3fa168a7cb0e260fcdecfe070853b163c9f2dfd2ad8213289bc7e5f')

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
