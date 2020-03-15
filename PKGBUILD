# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gutenpy
pkgver=0.3.0
pkgrel=11
pkgdesc="A text reader and catalog browser for Project Gutenberg"
arch=('any')
url="http://gutenpy.sourceforge.net"
license=('GPL')
depends=('pygtk')
source=(https://downloads.sourceforge.net/sourceforge/gutenpy/gutenpy-${pkgver}.zip gutenpy.desktop)
sha1sums=('f9f7fd7823447266eabacd0befda4e52bd97c79c'
          'f741244fef917bd64cf337bbffb3c7cd91e6b12e')

package() {
  cd gutenpy-${pkgver}
  cp ../gutenpy.desktop .
  python2 setup.py install --root="${pkgdir}"
  chmod 644 "${pkgdir}"/usr/share/{doc,pixmaps}/gutenpy/*
  ln -s gutenpy/gutenpy.xpm "${pkgdir}/usr/share/pixmaps/gutenpy.xpm"
  ln -s gutenpy.py "${pkgdir}/usr/bin/gutenpy"
}
