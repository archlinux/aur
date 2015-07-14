# Maintainer: Jim Rees at rees.org

pkgname=xfishtank
pkgver=2.5
pkgrel=1
pkgdesc="Fish swimming across your Root Window"
arch=('i686' 'x86_64')
url="http://jim.rees.org/computers/xfishtank.html"
license=('custom')
depends=('libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'imlib2' 'libpng')
makedepends=('imake')
source=(http://jim.rees.org/computers/xfishtank.tar.gz)
md5sums=('3aadec19d46d9ab1a115185428c19c1b')

build() {
  cd "$srcdir/$pkgname"
  xmkmf
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR=${pkgdir}
  mkdir -p ${pkgdir}/usr/share/licenses/"$pkgname"
  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/"$pkgname"/LICENSE
}
