# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: erk <valdemarerk@gmail.com>

pkgname=gravity-lang
pkgdesc="Gravity Programming Language."
pkgver=0.8.5
pkgrel=1
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://marcobambini.github.io/gravity/"
license=(MIT)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcobambini/gravity/archive/${pkgver}.tar.gz")
sha256sums=('5ef70c940cd1f3fec5ca908fb10af60731750d62ba39bee08cb4711b72917e1d')

build() {
  cd "gravity-${pkgver}"
  make gravity
}

package() {
  cd "gravity-${pkgver}"
  install -Dm755 "gravity" "$pkgdir/usr/bin/gravity"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
