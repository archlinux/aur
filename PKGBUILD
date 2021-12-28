# Maintainer: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-obfuscate
pkgver=0.0.4
pkgrel=2
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('tar' 'xz' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=($pkgname)
conflicts=($pkgname-git)
source=("https://gitlab.gnome.org/World/obfuscate/uploads/f16a8ac07d6baf7148f4b396ca08dc35/obfuscate-$pkgver.tar.xz")
sha256sums=('48bbee6b08905e1757c7852559dc25c7b239a63da5b5400c0aefc905d4496ef5')

build() {
  arch-meson obfuscate-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
