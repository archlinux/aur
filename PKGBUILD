# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-hud
pkgver=1.4.1
pkgrel=1
pkgdesc="Unity like HUD menu for the GNOME Desktop Environment"
arch=("any")
url="https://github.com/hardpixel/gnome-hud"
license=("GPL")
depends=("gtk3" "bamf" "libkeybinder3" "python" "python-gobject" "python-dbus" "python-fuzzysearch")
optdepends=(
  "rofi: Use rofi as menu dialog"
  "appmenu-gtk-module: AppMenu support for GTK2"
  "libdbusmenu-gtk2: DbusMenu support for GTK2"
  "libdbusmenu-gtk3: DbusMenu support for GTK3"
  "appmenu-qt4: AppMenu support for Qt4"
  "libdbusmenu-qt4: DbusMenu support for Qt4"
  "libdbusmenu-qt5: DbusMenu support for Qt5"
)
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("925e481b406838b8dd3ee6067931ed2a")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
