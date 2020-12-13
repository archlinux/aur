# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: Ner0
# Contributor: Pellegrino Prevete <

_pkgbase=menulibre
pkgname=$_pkgbase-git
pkgver=menulibre+2.2.1+76+gd137b2b
pkgrel=1
epoch=1
arch=(any)
license=("GPL3")
pkgdesc="An advanced menu editor that provides modern features in a clean, easy-to-use interface"
url="https://github.com/bluesabre/menulibre"
depends=("gdk-pixbuf2" "gnome-menus" "gsettings-desktop-schemas" "gtksourceview3" "python" "python-gobject" "python-psutil" "python-xdg" "xdg-utils")
makedepends=("python-distutils-extra")
install=menulibre.install
source=("git+https://github.com/bluesabre/menulibre.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "$_pkgbase" && python setup.py install --root="$pkgdir/" --optimize=1
}
