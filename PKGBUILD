# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname=gnunet-gtk
pkgver=0.14.0
pkgrel=1
pkgdesc='A frontend for GNUnet'
arch=('x86_64')
url='https://gnunet.org'
license=('GPL')
depends=('gnunet' 'glade')
source=(https://ftp.gnu.org/gnu/gnunet/$pkgname-$pkgver.tar.gz)
sha256sums=('8a93127f61b1a44c2485c4c9c7de31399edb23b9c25d9a6d6927f842563d2ca3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gnunet=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
