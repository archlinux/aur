# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=pluma-plugins
pkgver=1.26.0
pkgrel=1
pkgdesc="A set of plugins for Pluma"
arch=('any')
url="https://github.com/mate-desktop/$pkgname"
license=('GPL2')
depends=('pluma>=1.26.0')
makedepends=('autoconf-archive' 'gtksourceview4' 'make' 'mate-common' 'yelp-tools')
optdepends=('vte3: to use the embedded terminal'
            'dbus-python: to use the synctex plugin with atril'
            'atril: to use the synctex plugin with atril')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mate-desktop/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d9075281121fedce74eeda752d012f8b86407a5e1c89b25b4c370bb07c50f5dc30e74e11b6aa5333fcc401d45d220b801eb8dedf0650ae9aa16d9af271cac80e')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

