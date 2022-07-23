pkgname=paper-icon-theme
pkgver=1.5.0
pkgrel=3
pkgdesc="Paper is an open source desktop theme and icon project by Sam Hewitt"
arch=('any')
url="https://snwh.org/paper"
license=("CCPL:by-sa-4.0")
depends=('gtk-update-icon-cache')
makedepends=('meson')
provides=('paper-icon-theme')
conflicts=('paper-icon-theme-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snwh/$pkgname/archive/v.$pkgver.tar.gz")
b2sums=('dd7e327e83e1a79754a35f225d2c99745fd5628b00d54097f25fd4488fcd7d8defee060fa85fe79112f1ab1df07748aa7ccf8e37359d953dfad8e7a9174f4fef')

build() {
  arch-meson $pkgname-v.$pkgver build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

