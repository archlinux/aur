# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname=gnunet-gtk
pkgver=0.13.1
pkgrel=1
pkgdesc='A frontend for GNUnet'
arch=('x86_64')
url='https://gnunet.org'
license=('GPL')
depends=('gnunet' 'glade')
source=(https://ftp.gnu.org/gnu/gnunet/$pkgname-$pkgver.tar.gz)
sha256sums=('1268cd49c3f41d20d7dc98d98da3b9b69894a596988ec79737fc1c68027ebffd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gnunet=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
