# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=trayscale
pkgver=0.18.7
pkgrel=1
pkgdesc="An unofficial GUI wrapper for the Tailscale CLI client."
arch=(i686 x86_64 aarch64)
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita>=1:1.7')
makedepends=('go>=2:1.25.3' 'gobject-introspection')
optdepends=('tailscale: provides daemon that manages connection')
provides=(trayscale)
source=("https://github.com/DeedleFake/trayscale/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4709eddf7d85944b264e89f5939d31f5e2ca334b719a1cf1dc89b58302664aa4')

build() {
  cd "$pkgname-$pkgver"
  GOTOOLCHAIN=auto ./dist.sh build "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  GOTOOLCHAIN=auto ./dist.sh install "$pkgdir/usr"
}

# vim: ts=2 sw=2 et
