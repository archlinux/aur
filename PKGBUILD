# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=1.19.1
pkgrel=2
pkgdesc="EFL Edje Theme Editor - a theme graphical editor"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/eflete/"
license=('GPL2')
depends=('efl')
provides=("ewe=${pkgver}")
conflicts=("ewe")
replaces=("ewe")
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('f46097d73376cc020851f32ea45827652cf28cfc213de9f5bc624bfa38558b6907d33cda62a304019a0969fafa9cb71f2904e742b568b9881aa13025e1b9625a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
