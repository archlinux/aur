# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Philipp Jaeger <pjaeger@physik.uni-kl.de>
# Contributor: Klaus Denker <kldenker@unix-ag.uni-kl.de>
pkgname=gl_presenter
pkgver=0.3.3 # note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgrel=1
pkgdesc="A dual-screen OpenGL PDF presentation software"
arch=('any')
url="http://www.unix-ag.uni-kl.de/~kldenker/gl_presenter/"
license=('GPL')
groups=
provides=
depends=('qt4' 'poppler-qt4' 'glu')
source=(http://www.unix-ag.uni-kl.de/~kldenker/gl_presenter/download/source/gl_presenter-$pkgver.tar.bz2)
md5sums=('738065023c500584346d1351a02c6f90')

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4 -Wnone
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  mv gl_presenter $pkgdir/usr/bin/.
  ln $pkgdir/usr/bin/gl_presenter $pkgdir/usr/bin/glpresenter
}
