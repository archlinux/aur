# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ssh-studio
pkgver=1.3.1
pkgrel=1
pkgdesc='Easy, GUI SSH config editor and validator built with Python, GTK 4 and libadwaita'
arch=('any')
url='https://github.com/BuddySirJava/SSH-Studio'
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtksourceview5' 'libadwaita' 'python-cairo' 'python-gobject')
makedepends=('appstream-glib' 'blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/BuddySirJava/SSH-Studio.git#tag=${pkgver}")
b2sums=('6653928a0a1359fd2be7456dde8d3f306d7869d0d28a47932472dedde6b4711d7672f0ab69ce1c78722ed0936e2fde1cfb7e63238a569042e9fbabd4532f8de8')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
