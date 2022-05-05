# Maintainer: Your Name <youremail@domain.com>
pkgname=citations
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64')
url="https://gitlab.gnome.org/msandova/citations"
license=('GPL3')
depends=('glib2' 'libadwaita-git')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('e77fd43c464fc017bf86089e8d8c3c59450961c12a3dd82680277560b8dc85115ece6363ce8768b26d9eaa9e6cc5bbcf79bae8672a79baeb9f52643f31432965')

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
