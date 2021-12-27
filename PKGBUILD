# Maintainer: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-obfuscate
pkgver=0.0.4
pkgrel=1
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('tar' 'gzip' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=($pkgname)
conflicts=($pkgname-git)
source=("https://gitlab.gnome.org/World/obfuscate/-/archive/$pkgver/obfuscate-$pkgver.tar.gz")
sha256sums=('c6b0a5109abc54a285dbca1b97d0c22e5dd609962bc08caf6f9bb7c78746bd41')

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
