# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: erk <valdemarerk@gmail.com>

pkgname=gravity-lang
pkgdesc="Gravity Programming Language."
pkgver=0.8.1
pkgrel=1
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://marcobambini.github.io/gravity/"
license=(MIT)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcobambini/gravity/archive/${pkgver}.tar.gz")
sha256sums=('0db70b08984dc73f989d0f60dbd3e0c6e1027e7c31674f368a8e52843b0f9496')

build() {
  cd "gravity-${pkgver}"
  make gravity
}

package() {
  cd "gravity-${pkgver}"
  install -Dm755 "gravity" "$pkgdir/usr/bin/gravity"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
