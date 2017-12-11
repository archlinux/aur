# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander
_pkgname=razerCommander
pkgver=1.2.1.1
pkgrel=1
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-openrazer' 'gtk3' 'python')
makedepends=('meson')
source=("razercommander-$pkgver.tar.gz::https://github.com/GabMus/razerCommander/archive/$pkgver.tar.gz")
sha512sums=('2904f934d75e3336f1bbe2e90f570feae282bab423abcde6598e4af035489147293ba1efb0631d6af666565631116129489ae059dc3188e2f2237fda638f164b')

build() {
  arch-meson "$_pkgname-$pkgver" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
