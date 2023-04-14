# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.9.0
pkgrel=2
pkgdesc="trash/recycle bin utility for the command line"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://theimpossibleastronaut.com/rmw-website/"
license=('GPL3')
depends=('ncurses')
makedepends=('meson' 'ninja')
optdepends=('gettext' 'canfigger')

source=("https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('cc9d20733c9f9945054041ee6aeac7f4a4b7a675f297ffe388e4863fb84ed4a1')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
