# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.11.2
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
sha256sums=('365bb812932115cd913a02d25cb4fbda67a1d7b551cb688162348dad57fc919a')

build() {
  cd "$pkgname-$pkgver"
  ./dist.sh build "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  ./dist.sh install "$pkgdir/usr"
}

# vim: ts=2 sw=2 et
