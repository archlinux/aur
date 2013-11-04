# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=1.9.1
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'cegui' 'freeglut' 'intel-tbb' 'libltdl' 'libxml2' 'ogre' 'protobuf' 'qt4' 'tinyxml')
makedepends=('cmake')
install="${pkgname}.install"
source=(http://gazebosim.org/assets/distributions/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4f673d7f5daef456f871647d582ff493')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
