# Maintainer: Your Name <youremail@domain.com>
pkgname=amberol
pkgver=0.2.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/ebassi/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('398102908f6c2806c38eb3b80f680593ae0f7e1969a4cde8e4646043ae5ea6ec7c4b34216b63d17a8214e6a53a9fe79b69aa7c869d9c157cc9ee0d432bbac2aa')

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
