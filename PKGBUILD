# Maintainer: Debasish Patra <patradebasish1987@gmail.com>
pkgname=linuxthemestore-git
pkgver=1.0
pkgrel=1.0
pkgdesc="A Linux desktop app to install linux themes"
arch=('x86_64')
url="https://github.com/debasish-patra-1987/linuxthemestore"
license=('MIT')
provides=("linuxthemestore")
depends=('libadwaita' 'gtk4')
makedepends=('cargo' 'git' 'libadwaita' 'gtk4' 'meson' 'ninja' 'glib2')
conflicts=('linuxthemestore-bin')
source=("$pkgname::git+https://github.com/debasish-patra-1987/linuxthemestore")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr
  meson compile -C build
}
package() {
  cd "$srcdir/$pkgname"
  meson install -C build --destdir="$pkgdir"
}

