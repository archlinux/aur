# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.17.2
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64 aarch64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita>=1:1.6')
makedepends=('go>=2:1.24.0' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89b1b691893fa471234a78005d165cf1e5ab2fa8a510e65c9123431960b5228c')

build() {
  cd "$pkgname-$pkgver"
  ./dist.sh build "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  ./dist.sh install "$pkgdir/usr"
}

# vim: ts=2 sw=2 et
