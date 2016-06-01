# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Leandro Pincini <redpill@archlinux-br.org>

pkgname=gtk-bluecurve-engine
pkgver=1.0
pkgrel=5
pkgdesc="Original Bluecurve engine from Red Hat's artwork package."
source=("http://ftp.gnome.org/pub/gnome/teams/art.gnome.org/archive/themes/gtk2/GTK2-Wonderland-Engine-${pkgver}.tar.bz2")
url="https://fedoraproject.org/wiki/Design"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2')
sha256sums=('d54a7c9808c8dbfac088468a4e0a1a22ddc05011a9990361e0b5e855211d35da')

build() {
  cd "${srcdir}/Bluecurve"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/Bluecurve"
  make prefix="${pkgdir}/usr" install
}
