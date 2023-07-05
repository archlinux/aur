# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=libmatchbox
pkgver=1.12
pkgrel=2
pkgdesc="Base library for Matchbox WM"
arch=('x86_64')
license=('LGPL')
depends=('pango' 'libpng' 'libjpeg-turbo' 'xsettings-client' 'libxext')
url="https://www.yoctoproject.org/software-item/matchbox/"
source=("https://git.yoctoproject.org/libmatchbox/snapshot/libmatchbox-${pkgver}.tar.gz")
sha256sums=('648d7e1af82e69b79c0932ff9f85e6781584eada5da8662f70196916dd208f55')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --enable-pango --enable-jpeg --enable-xsettings
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
