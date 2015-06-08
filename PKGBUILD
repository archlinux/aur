# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=mpqc-shared
_pkgname=mpqc
pkgver=2.3.1
pkgrel=2
pkgdesc="The Massively Parallel Quantum Chemistry Program. Version with shared libraries"
arch=('i686' 'x86_64')
url="http://www.mpqc.org/"
license=('LGPL')
depends=('gcc-fortran' 'gcc-libs' 'lapack' 'perl' 'tk')
conflicts=('mpqc')
provides=('mpqc')
options=(libtool staticlibs)
source=(http://sourceforge.net/projects/mpqc/files/mpqc/${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('2f9b4f7487387730d78066a53764f848')

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-shared
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make installroot="${pkgdir}" install
  make installroot="${pkgdir}" install_devel
} 
