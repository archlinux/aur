# Maintainer: Matthias Blaicher <matthias[at]blaicher[dot]com>
pkgname=gsvit
pkgver=1.9.3
pkgrel=1
pkgdesc="Open Source FDTD solver with graphics card computing support."
url="http://gsvit.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('cuda' 'gwyddion' 'gtk2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('79013baa392510e0d382efb7b0d87cc16ff498735bd5bdbed7eb95e28b999f15')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --with-cuda=/opt/cuda --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: 
