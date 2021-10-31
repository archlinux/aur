# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=fontdownloader
_pkgname=Font-Downloader
pkgver=9.0.0
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('x86_64')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('bd629f0a08965341ad22f258a6a7c1c3c6dd150848f742e1f0d27995422b3754857fc8fd03a0d82707f6e97bc17e2ecbe1ff79cbd42df22625d414a27ca27bc9')


build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
