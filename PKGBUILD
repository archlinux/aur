# Maintainer: Jan Keith Darunday <jkcdarunday@uplb.edu.ph>

pkgname=ahoviewer-git
pkgver=git
pkgrel=1
pkgdesc="A GTK2 image viewer, manga reader, and booru browser."
arch=('i686' 'x86_64')
url="http://github.com/ahodesuka/ahoviewer"
license=('MIT')
depends=('curl>=7.16.0' 'gtkmm>=2.20.0' 'glibmm>=2.36.0' 'pugixml')
optdepends=('gstreamer' 'gst-plugins-bad' 'libunrar' 'libzip')
makedepends=('git')
source=("git://github.com/ahodesuka/ahoviewer")
md5sums=('SKIP')

pkgver() {
  cd 'ahoviewer'
  git describe | sed 's/-/./g'
}

build() {
  cd 'ahoviewer'
  ./bootstrap
  make
}

package() {
  make -C ahoviewer PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
