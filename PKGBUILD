# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname=gnunet-gtk
pkgver=0.15.0
pkgrel=1
pkgdesc='A frontend for GNUnet'
arch=('x86_64')
url='https://gnunet.org'
license=('GPL')
depends=('gnunet' 'glade')
source=(https://ftp.gnu.org/gnu/gnunet/$pkgname-$pkgver.tar.gz)
sha256sums=('14b2e5aa943b05ffa835152fc7b227895c45baccbfb4f63110fd93e95185ee1f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gnunet=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
