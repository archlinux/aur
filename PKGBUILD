# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=0.6.1
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
md5sums=('4fe6d83836b1a8f9597ff70120070ef5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
