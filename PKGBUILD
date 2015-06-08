# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>
pkgname=chordii
pkgver=4.5.1
pkgrel=1
pkgdesc="Program for generating guitar chord music sheets from text files"
arch=('i686' 'x86_64')
url="http://www.vromans.org/johan/projects/Chordii"
license=('GPL')
depends=(glibc)
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz)
md5sums=('72d404e25fa7e4d7a9f9d87fe93d25c4')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  }

package()
{
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/${pkgname}/examples
  install -m644 examples/* "${pkgdir}"/usr/share/${pkgname}/examples
}
