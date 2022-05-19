# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.3.0
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('glib2' 'libadwaita-git')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('cff0c44bc18a4c0856a07127babfeaf92c92d003336a3478e85ea9876901d7a9e62e5a471a73f905012918e45607ed23119ba49cce83f6baaa8b5efb5cc39618')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
