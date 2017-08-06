# Maintainer: Matthias Blaicher <matthias[at]blaicher[dot]com>
pkgname=gsvit
pkgver=1.8.2
pkgrel=1
pkgdesc="Open Source FDTD solver with graphics card computing support."
url="http://gsvit.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('cuda' 'gwyddion' 'gtk2')
optdepends=()
makedepends=('gcc5')
conflicts=()
replaces=()
backup=()

source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('df7032d46931a8bd0505f74ecdafdf47ddf5d01d0e76bc88135dd1cefb6fb9e3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --with-cuda=/opt/cuda --prefix="${pkgdir}/usr"  CC=gcc-5  CXX=c++-5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: 
