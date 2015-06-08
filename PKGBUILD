# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=digger
pkgver=20020314
pkgrel=6
pkgdesc="the digger game, cloned and remastered with additional features"
arch=('i686' 'x86_64')
url="http://www.digger.org"
license=('GPL')
depends=('sdl' 'zlib')
source=(
  'http://www.digger.org/digger-20020314.tar.gz'
  'digger.xpm'
  'digger.desktop'
)
md5sums=(
  'a16e90a49ed8ea90099b254d3ef5edfa'
  '3c4f1b57aca1cc6974626b1f263f2f08'
  '9c0913e55398bc236ac86c1e9ddc0740'
)
build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  make -f Makefile.sdl
}

package () {
  cd ${srcdir}/
  install -D digger.xpm ${pkgdir}/usr/share/icons/digger.xpm
  cd ${pkgname}-${pkgver}
  install -D digger ${pkgdir}/usr/bin/digger

  # install .desktop file
  mkdir -p ${pkgdir}/usr/share/{icons,applications}
  mv ${srcdir}/digger.desktop ${pkgdir}/usr/share/applications
}
