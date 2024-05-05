# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.12.3
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64 aarch64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita>=1:1.2')
makedepends=('go>=2:1.21.0' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27030c2dc4cdcbc9fc2397c5b889a3a7912094fe0a92d54a8fe7cfc7b50e229c')

build() {
  cd "$pkgname-$pkgver"
  ./dist.sh build "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  ./dist.sh install "$pkgdir/usr"
}

# vim: ts=2 sw=2 et
