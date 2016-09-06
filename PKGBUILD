# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=0.7.0
pkgrel=1
pkgdesc="EFL Edje Theme Editor - a theme graphical editor"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/about-eflete"
license=('GPL2')
depends=('efl')
provides=("ewe=${pkgver}")
conflicts=("ewe")
replaces=("ewe")
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('42bb14eaad84d60c3114d5487c9fe2ee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
