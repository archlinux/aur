# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.9.2
pkgrel=1
pkgdesc="trash/recycle bin utility for the command line"
arch=('i686' 'x86_64' 'aarch64')
url="https://theimpossibleastronaut.com/rmw-website/"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('meson' 'ninja')
optdepends=('gettext' 'canfigger')

source=("https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f1a7003f920297b0d1904c7c79debc06fbb00e1ef62871615a4fe836715a889d')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
