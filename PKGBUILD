# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=graphs
pkgver=1.7.2
pkgrel=1
pkgdesc="Plot and manipulate data (Gnome Circle app)"

arch=('x86_64')
url="https://welcome.gnome.org/app/Graphs/"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-matplotlib' 'python-scipy' 'python-numpy' 'python-numexpr' 'python-sympy' 'gobject-introspection')
provides=('graphs')
makedepends=('git' 'meson' 'blueprint-compiler' 'gettext' 'vala' 'gobject-introspection-runtime')
source=("https://gitlab.gnome.org/World/Graphs/-/archive/v${pkgver}/Graphs-v${pkgver}.tar.gz")
sha256sums=('90616099e3224c1fae0bfbe23faedf635936f101bae2f75e28fc8d7c2a845638')

build() {
  cd "Graphs-v${pkgver}"
  meson setup --buildtype=release "build/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "Graphs-v${pkgver}"
  cd "build/"
  meson install --destdir="${pkgdir}"
}
