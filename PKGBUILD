# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander
_pkgname=razerCommander
pkgver=1.2.0
pkgrel=2
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-openrazer' 'gtk3' 'python')
makedepends=('meson')
source=("razercommander-$pkgver.tar.gz::https://github.com/GabMus/razerCommander/archive/$pkgver.tar.gz")
sha512sums=('91a7c5dc028cd9ee745e29954a889ad58af2ec06eb621d690a5a7921611ad6af33307430a5d11be9f60e22f0a2c77e8f0a96432e69641fba67f8b7f96bdb6bb8')

build() {
  arch-meson "$_pkgname-$pkgver" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
