# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.3.0
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL3')
depends=('glib2' 'libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('7d23bde80c617f7cb47746a0a740a9419ea385a702a0dfb2e4b66c1cf439fb7130793e880e14dc27dc8b0978a46be600b9fbd6dd34abd09a54a37b84a2d87ffb')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}





