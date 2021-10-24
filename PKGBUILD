# Maintainer: Ryo Munakata <afpacket@gmail.com>
pkgname=isic
pkgver=0.07
pkgrel=2
pkgdesc="IP Stack Integrity Checker"
arch=('i686' 'x86_64')
url="http://isic.sourceforge.net/"
license=('BSD')
depends=('libnet>=1.1.0')
options=(!buildflags)
source=(
  "https://downloads.sourceforge.net/project/isic/isic/ISIC%20v0.07/isic-0.07.tgz"
  "$pkgname-$pkgver.patch"
)
md5sums=(
  '29f70c9bde9aa9128b8f7e66a315f9a4'
  '85a7672c471222eef29195a470ce6b1f'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${pkgname}-${pkgver}.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
}
# vim:set sw=2 sts=2 et:
