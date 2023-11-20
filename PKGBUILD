# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=4.1
pkgrel=2
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(d3be6f4e7e2ffc0f41236ea314183cb012fabef4dc557ea1f2eecf83c45947d4)

build() {
   arch-meson --buildtype=release "${srcdir}/${pkgname}-${pkgver}" build
   meson compile -C build
}

# Temporarily disabled for 4.1
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir="$pkgdir"
}
