# Maintainer: Frederik Lauber <acc-arch-pkgbuild-icecube-pal-git@flambda.de>
pkgname=icecube-pal-git
pkgrel=1
pkgdesc="Positional Astronomy Library"
url="https://github.com/IceCube-SPNO/pal"
arch=('x86_64' 'i686')
license=('gpl3+')
options=('!libtool')
source=('pal::git+https://github.com/IceCube-SPNO/pal')
depends=('erfa')
pkgver=v0.9.1.r17.gd452780
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pal"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}/pal"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pal"
  make DESTDIR="$pkgdir/" install
}

