# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=0.5.0
pkgrel=1
pkgdesc="EFL Edje Theme Editor - a theme graphical editor"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/eflete/"
license=('GPL2')
depends=('efl' 'elementary' 'enventor')
provides=("ewe=${pkgver}")
conflicts=("ewe")
replaces=("ewe")
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d6b7304586068c80d4cd2e5743d077c1')

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh --prefix=/usr --enable-enventor
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
