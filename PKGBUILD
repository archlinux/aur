# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gtherm
pkgver=0.0.3
pkgrel=1
pkgdesc="A simple daemon to monitor thermal zones and cooling devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://source.puri.sm/Librem5/gtherm"
license=(GPL3)
depends=(glib2)
makedepends=(git meson gtk-doc)
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://source.puri.sm/Librem5/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build \
    -Dgtk_doc=true
  meson compile -C build 
}

package() {
  meson install -C build --destdir $pkgdir
}
