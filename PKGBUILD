# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.1.0
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('c61c14661b9ea8443c66fc2f25066d1bd13bab65e6318af15ad49a525f1a90e76a9544b6f61d7eb4e4fa379bdf9bddebe89d12eeda913ae251fa967ce968a558')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
