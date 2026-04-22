# Maintainer: Sungjoon Moon <sumoon [at] seoulsaram [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet
pkgver=0.5.0
pkgrel=2
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(GPL-3.0-only)
_srcdir=wlgreet-${pkgver}
source=(${_srcdir}.tar.gz::"https://git.sr.ht/~kennylevinsen/wlgreet/archive/$pkgver.tar.gz")
sha256sums=('bc36c1b20eacba999ff5af2569c80eb4b93306a6ca967e1d05e1ec6bd705c524')
makedepends=(rust)

build() {
  cd ${_srcdir}
  cargo build --release
}

check() {
  cd ${_srcdir}
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 ${_srcdir}/target/release/wlgreet "$pkgdir"/usr/bin/
}
