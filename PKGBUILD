# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jim Rees at rees.org

pkgname=xfishtank
pkgver=2.6
pkgrel=1
pkgdesc="Fish swimming across your Root Window"
arch=('i686' 'x86_64')
url="http://jim.rees.org/computers/xfishtank.html"
license=('custom')
depends=('libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'imlib2' 'libpng')
makedepends=('imake')
source=(http://jim.rees.org/computers/xfishtank.tar.gz)
md5sums=('7349487c47e972565e488dc574103dfa')

build() {
  cd "$srcdir/$pkgname"
  xmkmf
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR=${pkgdir}
  mkdir -p ${pkgdir}/usr/share/licenses/"$pkgname"
  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/"$pkgname"/LICENSE
}
