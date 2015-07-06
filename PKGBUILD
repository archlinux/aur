#Maintainer: masutu <masutu dot atch at gmail dot com>
#Contributor: Jonathan Fine <were.Vire@gmail.com>
pkgname=glnemo2
pkgver=1.8.1
pkgrel=1
pkgdesc="an interactive visualization 3D program for nbody snapshots."
arch=('i686' 'x86_64')
url="http://projets.oamp.fr/projects/glnemo2"
license=('GPL')
depends=('glu' 'qt5-base')
source=(http://projets.lam.fr/attachments/download/1631/${pkgname}_${pkgver}.tar.gz)
md5sums=('9998fe1d9d51fa30cc746613c144598c')
noextract=( ${source[@]##*/} )

build() {
  cd $srcdir

  #work around strange bsdtar errors
  tar xfs ../$pkgname\_$pkgver.tar.gz
        
  cd $pkgname
  qmake -recursive
  make
}

package() {
  cd $srcdir/$pkgname
  
  install -D -m755 bin/unix/debug/glnemo2 $pkgdir/usr/bin/glnemo2
  install -D -m644 man/man1/glnemo2.1 $pkgdir/usr/share/man/man1/glnemo2.1
}

# vim:set ts=2 sw=2 et:

