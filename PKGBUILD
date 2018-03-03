# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander
_pkgname=razerCommander
pkgver=1.2.1.2
pkgrel=1
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-openrazer' 'gtk3' 'python')
makedepends=('meson')
source=("razercommander-$pkgver.tar.gz::https://github.com/GabMus/razerCommander/archive/$pkgver.tar.gz")
sha512sums=('3eabe79ee8b0f625aaf567b6d5707aadd1fbba3cc0840a8cabe12c0dd2f0617ea7b2aa328366a88c07bd5cadf5fd228f74512d6a0df2a98474a4d88e98431c54')

build() {
  arch-meson "$_pkgname-$pkgver" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
