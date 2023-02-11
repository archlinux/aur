# Maintainer: Andy Alt <arch_stanton5995 at protonmail.com>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.8.1
pkgrel=1
pkgdesc="safe-remove utility for the command line"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
makedepends=('meson' 'ninja')
optdepends=('gettext' 'canfigger')

source=("https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('abad25d8c0b2d6593fe426ca2c2d064207630e6a827a7d769f4991cbb583337b')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
