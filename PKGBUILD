# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ssh-studio
pkgver=1.3.0
pkgrel=1
pkgdesc='Easy, GUI SSH config editor and validator built with Python, GTK 4 and libadwaita'
arch=('any')
url='https://github.com/BuddySirJava/SSH-Studio'
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtksourceview5' 'libadwaita' 'python-cairo' 'python-gobject')
makedepends=('appstream-glib' 'blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/BuddySirJava/SSH-Studio.git#tag=${pkgver}")
b2sums=('3103b61f8370b89d95cd17b14fdfe114aa275ac0acf76ba62344005df3f78c09ad52f3fd2a1450cb769ef68c8f9a33f10af463d361fc8d2b3ba9faa72853817e')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
