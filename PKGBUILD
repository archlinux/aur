# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.3.1
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('34b07bcfbb5c152f7e328a4c8184711e1461b60ac7a162761e6dec18a6767ab3f227bfd2e5325fc41ecec8ed16c54f3dd67b2dc176e2af2e035f28eeb7c030ad')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}





