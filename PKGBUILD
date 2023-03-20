# Maintainer: Evan Maddock <maddock.evan at vivaldi dot net>

pkgname='budgie-user-indicator-redux'
pkgver=1.0.1
pkgrel=1
pkgdesc='Manage your user session from the Budgie panel'
arch=('x86_64')
url='https://github.com/EbonJaeger/budgie-user-indicator-redux'
license=('GPL2')
depends=('budgie-desktop' 'accountsservice' 'libgee' 'libpeas')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EbonJaeger/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e5ed4d81b4fddd15b7388a6b8dce42169e1b4673df8aa00bbafa65cdb145f08')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
