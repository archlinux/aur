# Maintainer: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-obfuscate
pkgver=0.0.7
pkgrel=1
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('tar' 'xz' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=($pkgname)
conflicts=($pkgname-git)
source=("https://gitlab.gnome.org/World/obfuscate/uploads/43de595795bf88e96666e2a28c711175/obfuscate-$pkgver.tar.xz")
sha256sums=('eac73be3bb259d52acd6d66e383d18466f5c478a96f3f3f7ee96e7cc7cdfb7ca')

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
