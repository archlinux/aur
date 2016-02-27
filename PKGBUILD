# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=0.6.0
pkgrel=1
pkgdesc="EFL Edje Theme Editor - a theme graphical editor"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/eflete/"
license=('GPL2')
depends=('efl>=1.17' 'elementary>=1.17')
provides=("ewe=${pkgver}")
conflicts=("ewe")
replaces=("ewe")
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8e4cb4389c03fcf653c29438976625d9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
