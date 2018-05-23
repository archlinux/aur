# Contributor: masutu <masutu dot atch at gmail dot com>
# Contributor: Jonathan Fine <were.Vire@gmail.com>
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=glnemo2
pkgver=1.11.1
pkgrel=1
pkgdesc="an interactive visualization 3D program for nbody snapshots."
arch=('i686' 'x86_64')
url="http://projets.oamp.fr/projects/glnemo2"
license=('custom')
depends=('glu' 'qt5-base' 'ccfits' 'hdf5-cpp-fortran' 'glm' 'libtirpc')
source=(https://gitlab.lam.fr/jclamber/glnemo2/-/archive/v${pkgver}/glnemo2-v${pkgver}.tar.gz)
md5sums=('4d31b78227d39fe3b307c853a72a7c29')

build() {
  cd $pkgname-v$pkgver
  mkdir -p build
  cd build
  cmake ..
  make -j4
}

package() {
  cd $pkgname-v$pkgver
  install -D -m755 build/bin/glnemo2 $pkgdir/usr/bin/glnemo2
  install -D -m644 man/man1/glnemo2.1 $pkgdir/usr/share/man/man1/glnemo2.1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:

